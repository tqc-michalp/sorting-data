# Sorting


## Overview

Sorting gem provide different scopes. If you would like to use them install a gem as we described below and then in your console type: 'sorting'. You will see data scopes.

### Architecture

Sorting logic contains an OOP pattern and approach (e.g. SOLID). You can easily extend gem to serve new features, for example, acts as an endpoint. I intentionally leave for You some NOTEs and placeholders.


## Installation

```
$ sorting-excercise/sorting/pkg
$ gem install sorting
```
  
  
## Usage

* Navigate to the directory where you have got CSV file with data;
```
$ cd sorting-excercise/sorting
$ tree
.
├── doctors.csv
├── README.md
└── sorting
```
* If you have got file: `doctors.csv` or another contains appropriate data, go to next step;
* Execute `sorting` with a scope and appropriate params. Just check example: 
```
$ sorting find_doctor --type='csv' --path='./doctors.csv' --day="Monday"
```
* Example result is:
```
Dr. Lynch is available
Dr. Rieux is available
```


## License

The gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
