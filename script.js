document.addEventListener('DOMContentLoaded', () => {
    const addBtn = document.getElementById('add-btn');
    const todoInput = document.getElementById('todo-input');
    const todoList = document.getElementById('todo-list');

    addBtn.addEventListener('click', addTodo);
    todoInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            addTodo();
        }
    });

    function addTodo() {
        const todoText = todoInput.value.trim();
        if (todoText === '') {
            alert('Please enter a todo item');
            return;
        }

        const li = document.createElement('li');
        li.textContent = todoText;

        const deleteBtn = document.createElement('button');
        deleteBtn.textContent = 'Delete';
        deleteBtn.addEventListener('click', () => {
            todoList.removeChild(li);
        });

        li.appendChild(deleteBtn);
        todoList.appendChild(li);

        todoInput.value = '';
        todoInput.focus();
    }
});