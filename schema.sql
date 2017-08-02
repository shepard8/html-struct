-- (PostgreSQL syntax)

CREATE EXTENSION citext;

CREATE DOMAIN elt_name AS CITEXT NOT NULL;
CREATE DOMAIN elt_names AS CITEXT[];
CREATE DOMAIN cat_name AS CITEXT NOT NULL;
CREATE DOMAIN cat_names AS CITEXT[];
CREATE DOMAIN att_name AS CITEXT;
CREATE DOMAIN att_value AS CITEXT;

CREATE TABLE element (
  elt_name elt_name PRIMARY KEY
);

CREATE TABLE category (
  cat_name cat_name PRIMARY KEY
);

CREATE TABLE element_category (
  elt_name elt_name REFERENCES element,
  cat_name cat_name REFERENCES category,
  PRIMARY KEY (elt_name, cat_name)
);

CREATE TABLE element_category_has_elts (
  elt_name elt_name REFERENCES element,
  cat_name cat_name REFERENCES category,
  ele_elts elt_names,
  PRIMARY KEY (elt_name, cat_name, ele_elts)
);

CREATE TABLE element_category_has_attr (
  elt_name elt_name REFERENCES element,
  cat_name cat_name REFERENCES category,
  att_name att_name,
  PRIMARY KEY (elt_name, cat_name, att_name)
);

CREATE TABLE element_category_value (
  elt_name elt_name REFERENCES element,
  cat_name cat_name REFERENCES category,
  att_name att_name,
  ecv_value att_value,
  ecv_neg BOOLEAN NOT NULL,
  PRIMARY KEY (elt_name, cat_name, att_name, ecv_value, ecv_neg)
);

CREATE TABLE element_category_no_descendant (
  elt_name elt_name REFERENCES element,
  cat_name cat_name REFERENCES category,
  eld_elt elt_name REFERENCES element,
  PRIMARY KEY (elt_name, cat_name, eld_elt)
);

CREATE TABLE element_context_category (
  elt_name elt_name REFERENCES element,
  cat_name cat_name REFERENCES category,
  PRIMARY KEY (elt_name, cat_name)
);

CREATE TABLE element_context_child_of (
  elt_name elt_name REFERENCES element,
  ecc_child_of elt_name REFERENCES element,
  ecc_position VARCHAR(20) NOT NULL,
  ecc_once BOOLEAN NOT NULL,
  PRIMARY KEY (elt_name, ecc_child_of)
);

CREATE TABLE element_context_root (
  elt_name elt_name REFERENCES element
);

CREATE TABLE element_context_subdocument (
  elt_name elt_name REFERENCES element
);

CREATE TABLE element_context_subelement (
  elt_name elt_name REFERENCES element,
  ecs_elt elt_name REFERENCES element,
  ecs_sub elt_name REFERENCES element
);

CREATE TABLE element_context_between (
  elt_name elt_name REFERENCES element,
  ecb_parent elt_name REFERENCES element,
  ecb_before elt_names,
  ecb_after elt_names
);

CREATE TABLE element_context_child_no_attr (
  elt_name elt_name REFERENCES element,
  cna_parent elt_name REFERENCES element,
  att_name att_name
);

CREATE TABLE unparsed (
  elt_name elt_name REFERENCES element,
  unp_section VARCHAR(50) NOT NULL,
  unp_text TEXT NOT NULL
);

