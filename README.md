# three-column-splitview

The Apple documentation on [NavigationSplitView](https://developer.apple.com/documentation/swiftui/navigationsplitview) gives you this code sample.

```
    @State private var departmentId: Department.ID? // Single selection.
    @State private var employeeIds: Set<Employee.ID> = [] // Multiple selection.
    
    var body: some View {
        NavigationSplitView {
            List(model.departments, selection: $departmentId) { department in
                Text(department.name)
            }
        } content: {
            if let department = model.department(id: departmentId) {
                List(department.employees, selection: $employeeIds) { employee in
                    Text(employee.name)
                }
            } else {
                Text("Select a department")
            }
        } detail: {
            EmployeeDetails(employeeIds: employeeIds)
        }
    }
```

This sample app fills in the gaps for reference using the three column navigation split view.

