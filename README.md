TableKit
============
iOS UITableView based library that allows easy to work with tables.

Features
------------
* **Fast, memory efficient and nonredundant**  
   *It gives same performance as standard UITableViewController and is not wasteful of resources.*

* **Flexible object oriented architecture**  
   *TableKit is a good base platform to implement your own extensions.*

* **Hierarchical sections/cells model**  
   *It allows to build table structure at one place with just few lines of code.*

* **Powerful customization of existing code**  
   *Before implementing custom cells, try to use attributes technique.*

* **Xcode templates**  
   *TableKit comes with Xcode templates used to generate class stubs.*

Simple Usage
--------------
* **Define table structure**

`	TKStaticCell* staticCell = [TKStaticCell cellWithText:@"Hello World!"];  
	TKTextFieldCell* textCell = [TKTextFieldCell cellWithText:@"Editing Text"];  
	TKSection* section = [TKSection sectionWithCells:staticCell, textCell, nil];  
	NSArray* sections = [NSArray arrayWithObjects:section, nil];  
`

* **Customize cells by applying attributes**

`	staticCell.tableViewCell.accessoryType = UITableViewCellAccessoryCheckmark;  
	textCell.textField.font = [UIFont systemFontOfSize:20];  
	textCell.textField.textColor = [UIColor redColor];  
`

Advanced Usage
--------------
* **Add custom Theme to your project**  
   *Using Xcode template you can do it just in few mouse clicks.*

* **Customize Cells of your Theme**  
   *Just add configuration code to generated class stubs.*

* **Add new custom Cells to your Theme**  
   *Use Xcode template to create cell classes and implement them as you like.*
