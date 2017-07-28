The reference when it comes to HTML5 is the W3C (https://www.w3.org/TR/html5/)
specification.

Although it is really complete and clear, it is also a very big document. To
support the effort of the TyXML (https://ocsigen.org/tyxml/) developers who try
to come up with OCaml types that represent a valid HTML5 document, Html-struct
parses the HTML5 specification, more specifically the elements data of the
HTML5 specification, and stores this data in OCaml structures that are easy to
work with.

As this data could maybe be useful to developers from other languages, an
executable also exports this data to the SQL format.

To avoid those who just want a database representing the HTML5 structure the
burden of installing OCaml and compile the project, the output of the
executable is given in output.sql. Please be aware that some parts of the
specification can not (yet) be parsed by html-struct. These are referenced at
the end of output.sql as comments.

This is work in progress.

