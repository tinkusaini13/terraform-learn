Terraform input variables are used as parameters to input values at run time to customize our deployments. Input terraform variables can be defined in the main.tf configuration file but it is a best practice to define them in a separate variable.tf file to provide better readability and organization.


The variable declaration can optionally include three arguments:

- description: briefly explain the purpose of the variable and what kind of value is expected.
- type: specifies the type of value such as string, number, bool, map, list, etc.
- default: If present, the variable is considered to be optional and if no value is set, the default value is used


## Primitive Types:

A primitive type is a simple type that isn’t made from any other type. The available primitive types are:

- string: a sequence of characters representing some text, such as “hello”.
- number: a numeric value. The number type can represent both whole numbers like 15 and fractional values such as 6.28318.
-bool: either true or false.

## Complex Types
A complex type is a type that groups multiple values into a single value. These values could be of a similar type or different types.

list:
map:
object:


## Uses of Terraform Variables:

Configuration Reusability:
Dynamic Resource Creation:
Collaboration and Sharing:
Enhanced Maintainability:



### Frequently Asked Questions

How do I define variables in Terraform?
Variables in Terraform can be defined in several ways. You can define them in a separate variables file, within the Terraform configuration file itself, or through environment variables. The method you choose depends on your preference and the level of sensitivity of the variable values.


Q1.  How do I use variables in my Terraform configurations?
- To use variables in your Terraform configurations, you can reference them by using the syntax var.variable_name. For example, if you have a variable named region, you can use it as var.region in resource blocks or other parts of your configuration.


Q2. Can I assign default values to Terraform variables?
- Yes, you can assign default values to Terraform variables. By specifying a default value in the variable declaration, Terraform will use that value if no other value is provided when running Terraform commands. This allows you to make certain variables optional.


Q3. How can I input sensitive information, such as passwords or API keys, as variables?
- Sensitive information should not be stored directly in your Terraform configurations. Instead, you can use sensitive input mechanisms, such as environment variables or a secret management system, to input and retrieve sensitive values for your variables.


Q4. Can I use complex data types as Terraform variables?
- Yes, Terraform supports complex data types as variables, including lists, maps, and objects. This allows you to pass structured data to your configurations and use them in resource blocks or other parts of your code.


Q5. Are there any naming conventions for Terraform variables?
- There are no strict naming conventions for Terraform variables, but it is recommended to use descriptive and meaningful names that convey the purpose of the variable. It is also advisable to follow a consistent naming convention across your Terraform project for better maintainability.

Q6. Can I define variable dependencies in Terraform?
- Terraform does not have direct variable dependencies. However, you can use outputs in conjunction with variables to create dependencies between resources and retrieve values from one resource to use as input for another.

## Using Custome terraform file....
    terraform plan -var-file=dev.tfvars

### Example:

## Terraform variable file:
![image](https://github.com/tinkusaini13/terraform-learn/assets/88707521/5da50676-8cd0-4d36-98da-0b87f8da9379)

## Terraform main file:
![image](https://github.com/tinkusaini13/terraform-learn/assets/88707521/f88e022c-b96c-4b0e-82e8-4616b4efb221)

## terraform plan
![image](https://github.com/tinkusaini13/terraform-learn/assets/88707521/3849df91-5e61-4c83-9f8d-ffcabef66a36)
