#!/usr/bin/python3

"""
This script retrieves information about an employee's TODO list progress
from a REST API.
"""

import sys
import requests


def get_todo_list_progress(employee_id):
    """
    Retrieves and displays information about an employee's TODO list progress.

    Args:
        employee_id (int): The ID of the employee.

    Returns:
        None
    """
    base_url = 'https://jsonplaceholder.typicode.com'
    user_url = f'{base_url}/users/{employee_id}'
    todos_url = f'{base_url}/todos?userId={employee_id}'

    try:
        user_response = requests.get(user_url)
        todos_response = requests.get(todos_url)

        user_data = user_response.json()
        todos_data = todos_response.json()

        employee_name = user_data.get('name')
        completed_tasks = [todo for todo in todos_data if todo.get('completed')]
        total_tasks = todos_data

        print(f"Employee {employee_name} is done with tasks "
              f"({len(completed_tasks)}/{len(total_tasks)}):")

        for task in completed_tasks:
            print(f"\t{task.get('title')}")

    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")


if __name__ == "__main__":
    if len(sys.argv) != 2 or not sys.argv[1].isdigit():
        print("Usage: python3 gather_data_from_an_API.py <employee_id>")
        sys.exit(1)

    employee_id = int(sys.argv[1])
    get_todo_list_progress(employee_id)

