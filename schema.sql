-- (PostgreSQL syntax)

CREATE EXTENSION citext;

CREATE DOMAIN elt_name AS CITEXT;
CREATE DOMAIN elt_names AS CITEXT[];
CREATE DOMAIN cat_name AS CITEXT NOT NULL;
CREATE DOMAIN attr_name AS CITEXT;

CREATE TABLE element (
  elt_name elt_name NOT NULL PRIMARY KEY
);

CREATE TABLE category (
  cat_name cat_name PRIMARY KEY
);

CREATE TABLE element_category (
  elt_name elt_name NOT NULL REFERENCES element,
  cat_name cat_name REFERENCES category,
  elc_has_elts elt_names DEFAULT NULL,
  elc_has_attr attr_name DEFAULT NULL,
  PRIMARY KEY (elt_name, cat_name)
);

CREATE TABLE element_context_category (
  elt_name elt_name NOT NULL REFERENCES element,
  cat_name cat_name REFERENCES category,
  PRIMARY KEY (elt_name, cat_name)
);

CREATE TABLE element_context_child_of (
  elt_name elt_name NOT NULL REFERENCES element,
  ecc_child_of elt_name NOT NULL REFERENCES element,
  ecc_first BOOLEAN NOT NULL,
  ecc_once BOOLEAN NOT NULL,
  PRIMARY KEY (elt_name, ecc_child_of)
);

CREATE TABLE element_context_root (
  elt_name elt_name NOT NULL REFERENCES element
);

CREATE TABLE element_context_subdocument (
  elt_name elt_name NOT NULL REFERENCES element
);

CREATE TABLE element_context_subelement (
  elt_name elt_name NOT NULL REFERENCES element,
  ecs_elt elt_name NOT NULL REFERENCES element,
  ecs_sub elt_name NOT NULL REFERENCES element
);

CREATE TABLE unparsed (
  elt_name elt_name NOT NULL REFERENCES element,
  unp_section VARCHAR(50) NOT NULL,
  unp_text TEXT NOT NULL
);

