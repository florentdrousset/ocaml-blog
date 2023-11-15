(lang dune 3.11)

(name ocaml_blog)

(generate_opam_files true)

(source
 (github florentdrousset/ocaml-blog))

(authors "Florent Drousset")

(documentation https://url/to/documentation)

(package
 (name ocaml_blog)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml dune dream)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
