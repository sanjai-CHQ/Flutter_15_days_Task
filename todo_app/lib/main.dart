import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoHomePage(),
    );
  }
}

class TodoItem {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;

  TodoItem({
    required this.id,
    required this.title,
    this.description = '',
    this.isCompleted = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  TodoItem copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'TodoItem(id: $id, title: $title, isCompleted: $isCompleted)';
  }
}

enum TodoFilter {
  all,
  active,
  completed,
}

class TodoHomePage extends StatefulWidget {
  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  List<TodoItem> _todos = [];
  TodoFilter _currentFilter = TodoFilter.all;
  int _nextId = 1;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _addSampleTodos();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _addSampleTodos() {
    setState(() {
      _todos.addAll([
        TodoItem(id: _nextId++, title: 'Learn Flutter Widgets', description: 'Study stateless and stateful widgets'),
        TodoItem(id: _nextId++, title: 'Practice Keys', description: 'Understand different types of keys', isCompleted: true),
        TodoItem(id: _nextId++, title: 'Build Todo App', description: 'Create an interactive todo application'),
      ]);
    });
  }

  void _addTodo() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _todos.add(TodoItem(
          id: _nextId++,
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
        ));
      });
      
      _titleController.clear();
      _descriptionController.clear();
      
      _showSnackBar('Todo added successfully! 📝');
    }
  }

  void _deleteTodo(int id) {
    setState(() {
      _todos.removeWhere((todo) => todo.id == id);
    });
    _showSnackBar('Todo deleted! 🗑️');
  }

  void _toggleTodo(int id) {
    setState(() {
      int index = _todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        _todos[index] = _todos[index].copyWith(
          isCompleted: !_todos[index].isCompleted,
        );
      }
    });
  }

  List<TodoItem> _getFilteredTodos() {
    switch (_currentFilter) {
      case TodoFilter.active:
        return _todos.where((todo) => !todo.isCompleted).toList();
      case TodoFilter.completed:
        return _todos.where((todo) => todo.isCompleted).toList();
      case TodoFilter.all:
      default:
        return _todos;
    }
  }

  void _changeFilter(TodoFilter filter) {
    setState(() {
      _currentFilter = filter;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<TodoItem> filteredTodos = _getFilteredTodos();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('My Todo App'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Column(
        children: [
          FilterButtonsSection(
            currentFilter: _currentFilter,
            onFilterChanged: _changeFilter,
            todoCount: _todos.length,
            completedCount: _todos.where((todo) => todo.isCompleted).length,
          ),
          
          AddTodoSection(
            formKey: _formKey,
            titleController: _titleController,
            descriptionController: _descriptionController,
            onAddTodo: _addTodo,
          ),
  
          Expanded(
            child: TodoListSection(
              todos: filteredTodos,
              currentFilter: _currentFilter,
              onToggleTodo: _toggleTodo,
              onDeleteTodo: _deleteTodo,
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButtonsSection extends StatelessWidget {
  final TodoFilter currentFilter;
  final Function(TodoFilter) onFilterChanged;
  final int todoCount;
  final int completedCount;

  const FilterButtonsSection({
    Key? key,
    required this.currentFilter,
    required this.onFilterChanged,
    required this.todoCount,
    required this.completedCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int activeCount = todoCount - completedCount;
    
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCard('Total', todoCount, Colors.blue),
              _buildStatCard('Active', activeCount, Colors.orange),
              _buildStatCard('Completed', completedCount, Colors.green),
            ],
          ),
          
          SizedBox(height: 16),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFilterButton(
                context,
                'All',
                TodoFilter.all,
                Icons.list,
                Colors.blue,
              ),
              _buildFilterButton(
                context,
                'Active',
                TodoFilter.active,
                Icons.radio_button_unchecked,
                Colors.orange,
              ),
              _buildFilterButton(
                context,
                'Completed',
                TodoFilter.completed,
                Icons.check_circle,
                Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, int count, Color color) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Text(
              '$count',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(
    BuildContext context,
    String label,
    TodoFilter filter,
    IconData icon,
    Color color,
  ) {
    bool isSelected = currentFilter == filter;
    
    return ElevatedButton.icon(
      onPressed: () => onFilterChanged(filter),
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? color : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.grey[700],
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class AddTodoSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final VoidCallback onAddTodo;

  const AddTodoSection({Key? key,
  required this.formKey,
  required this.titleController,
  required this.descriptionController,
  required this.onAddTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Todo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 12,),

            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title *',
                hintText: 'Enter todo title',
                prefixIcon: Icon(Icons.title, color: Colors.blue),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              validator: (value){
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a title';
                }
                if (value.trim().length < 3) {
                  return 'Title must be at least 3 characters long';
                }
                if (value.trim().length > 50) {
                  return 'Title must be less than 50 characters';
                }
                return null;
              }
            ),

            SizedBox(height: 12),

            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description (Optional)',
                hintText: 'Enter todo description',
                prefixIcon: Icon(Icons.description, color: Colors.grey),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              maxLines: 2,
              validator: (value) {
                if (value != null && value.trim().length > 100) {
                  return 'Description must be less than 100 characters';
                }
                return null;
              },
            ),
            
            SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onAddTodo,
                icon: Icon(Icons.add, color: Colors.white),
                label: Text(
                  'Add Todo',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoListSection extends StatelessWidget {
  final List<TodoItem> todos;
  final TodoFilter currentFilter;
  final Function(int) onToggleTodo;
  final Function(int) onDeleteTodo;

  const TodoListSection({
    Key? key,
    required this.todos,
    required this.currentFilter,
    required this.onToggleTodo,
    required this.onDeleteTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoItemCard(
          key: ValueKey(todos[index].id), 
          todo: todos[index],
          onToggle: () => onToggleTodo(todos[index].id),
          onDelete: () => onDeleteTodo(todos[index].id),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    String message;
    IconData icon;
    Color color;
    
    switch (currentFilter) {
      case TodoFilter.active:
        message = 'No active todos!\nAll tasks are completed 🎉';
        icon = Icons.check_circle_outline;
        color = Colors.green;
        break;
      case TodoFilter.completed:
        message = 'No completed todos yet!\nStart completing some tasks 💪';
        icon = Icons.radio_button_unchecked;
        color = Colors.orange;
        break;
      case TodoFilter.all:
      default:
        message = 'No todos yet!\nAdd your first todo above ✨';
        icon = Icons.add_circle_outline;
        color = Colors.blue;
        break;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: color.withOpacity(0.5),
          ),
          SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}


class TodoItemCard extends StatelessWidget {
  final TodoItem todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TodoItemCard({
    Key? key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onToggle, 
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: todo.isCompleted ? Colors.green.withOpacity(0.3) : Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: onToggle,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: todo.isCompleted ? Colors.green : Colors.transparent,
                    border: Border.all(
                      color: todo.isCompleted ? Colors.green : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: todo.isCompleted
                      ? Icon(Icons.check, size: 16, color: Colors.white)
                      : null,
                ),
              ),
              
              SizedBox(width: 16),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                        color: todo.isCompleted ? Colors.grey[600] : Colors.grey[800],
                      ),
                    ),
                    
                    if (todo.description.isNotEmpty) ...[
                      SizedBox(height: 4),
                      Text(
                        todo.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: todo.isCompleted ? Colors.grey[500] : Colors.grey[600],
                          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ],
                    
                    SizedBox(height: 8),
                    Text(
                      'Created: ${_formatDate(todo.createdAt)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              
              Column(
                children: [
                  IconButton(
                    onPressed: onToggle,
                    icon: Icon(
                      todo.isCompleted ? Icons.undo : Icons.check,
                      color: todo.isCompleted ? Colors.orange : Colors.green,
                    ),
                    tooltip: todo.isCompleted ? 'Mark as incomplete' : 'Mark as complete',
                  ),
                  
                  IconButton(
                    onPressed: () {
                      _showDeleteDialog(context);
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                    tooltip: 'Delete todo',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Todo'),
          content: Text('Are you sure you want to delete "${todo.title}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                onDelete();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Delete', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}