;; Keywords

"return"
  @keyword.return

[
  (self)
  (break)
  "let"
] @keyword


(boolean)
  @boolean

(while
[
  "while"
  "do"
  "end"
] @repeat)

(for
[
  "for"
  "in"
  "do"
  "end"
] @repeat)

(if
[
  "if"
  "elseif"
  "else"
  "then"
  "end"
] @conditional)

(function_statement
[
  "function"
  "end"
] @keyword.function)

(function_expression
[
  "function"
  "end"
] @keyword.function)

;; Operators

[
 "and"
 "or"
 "not"
] @keyword.operator

[
  (binary_operator)
  (try)
] @operator

;; Punctuations

[
  ":"
  ","
  "."
] @punctuation.delimiter

;; Brackets

[
 "("
 ")"
 "["
 "]"
 "{"
 "}"
 "${"
] @punctuation.bracket

;; Identifiers

(identifier) @variable

(assignment
  (identifier) @method
  (function_expression))

 
(dictionary_index
  method: (identifier) @method.call)
  
(function_call
  (identifier) @method.call)

(function_statement
  (identifier) @method)

(variable_declaration
  (identifier) @method
  (function_expression))

;; Literals

(char) @character

(comment) @comment @spell

(float) @float

(nil) @constant.builtin

(number) @number

(string) @string @spell
