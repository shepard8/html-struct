CREATE DOMAIN elt_name AS VARCHAR(20) NOT NULL;
CREATE DOMAIN cat_name AS VARCHAR(20) NOT NULL;

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

