CREATE DOMAIN elt_name AS VARCHAR(21) NOT NULL;
CREATE DOMAIN cat_name AS VARCHAR(42) NOT NULL;

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

CREATE TABLE element_context_category (
  elt_name elt_name REFERENCES element,
  cat_name cat_name REFERENCES category,
  PRIMARY KEY (elt_name, cat_name)
);

CREATE TABLE element_context_child_of (
  elt_name elt_name REFERENCES element,
  ecc_child_of elt_name REFERENCES element,
  ecc_first BOOLEAN NOT NULL,
  ecc_once BOOLEAN NOT NULL,
  PRIMARY KEY (elt_name, ecc_child_of)
);

