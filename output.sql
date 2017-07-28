INSERT INTO element (elt_name) VALUES ('a'), ('abbr'), ('address'), ('area'), ('article'), ('aside'), ('audio'), ('b'), ('base'), ('bdi'), ('bdo'), ('blockquote'), ('body'), ('br'), ('button'), ('canvas'), ('caption'), ('cite'), ('code'), ('col'), ('colgroup'), ('data'), ('datalist'), ('dd'), ('del'), ('dfn'), ('div'), ('dl'), ('dt'), ('em'), ('embed'), ('fieldset'), ('figcaption'), ('figure'), ('footer'), ('form'), ('h1'), ('h2'), ('h3'), ('h4'), ('h5'), ('h6'), ('head'), ('header'), ('hr'), ('html'), ('i'), ('iframe'), ('img'), ('input'), ('ins'), ('kbd'), ('keygen'), ('label'), ('legend'), ('li'), ('link'), ('main'), ('map'), ('mark'), ('meta'), ('meter'), ('nav'), ('noscript'), ('object'), ('ol'), ('optgroup'), ('option'), ('output'), ('p'), ('param'), ('pre'), ('progress'), ('q'), ('rb'), ('rp'), ('rt'), ('rtc'), ('ruby'), ('s'), ('samp'), ('script'), ('section'), ('select'), ('small'), ('source'), ('span'), ('strong'), ('style'), ('sub'), ('sup'), ('table'), ('tbody'), ('td'), ('template'), ('textarea'), ('tfoot'), ('th'), ('thead'), ('time'), ('title'), ('tr'), ('track'), ('u'), ('ul'), ('var'), ('video'), ('wbr');

INSERT INTO category (cat_name) VALUES ('Embedded content'), ('Flow content'), ('Form-associated element'), ('Heading content'), ('Interactive content'), ('Labelable element'), ('Listed'), ('Metadata content'), ('Palpable content'), ('Phrasing content'), ('Reassociateable'), ('Script-supporting element'), ('Sectioning content'), ('Sectioning root');

INSERT INTO element_category (elt_name, cat_name) VALUES ('a', 'Palpable content'), ('a', 'Interactive content'), ('a', 'Phrasing content'), ('a', 'Flow content'), ('abbr', 'Palpable content'), ('abbr', 'Phrasing content'), ('abbr', 'Flow content'), ('address', 'Palpable content'), ('address', 'Flow content'), ('area', 'Phrasing content'), ('area', 'Flow content'), ('article', 'Palpable content'), ('article', 'Sectioning content'), ('article', 'Flow content'), ('aside', 'Palpable content'), ('aside', 'Sectioning content'), ('aside', 'Flow content'), ('audio', 'Embedded content'), ('audio', 'Phrasing content'), ('audio', 'Flow content'), ('b', 'Palpable content'), ('b', 'Phrasing content'), ('b', 'Flow content'), ('base', 'Metadata content'), ('bdi', 'Palpable content'), ('bdi', 'Phrasing content'), ('bdi', 'Flow content'), ('bdo', 'Palpable content'), ('bdo', 'Phrasing content'), ('bdo', 'Flow content'), ('blockquote', 'Palpable content'), ('blockquote', 'Sectioning root'), ('blockquote', 'Flow content'), ('body', 'Sectioning root'), ('br', 'Phrasing content'), ('br', 'Flow content'), ('button', 'Palpable content'), ('button', 'Listed'), ('button', 'Interactive content'), ('button', 'Phrasing content'), ('button', 'Flow content'), ('canvas', 'Palpable content'), ('canvas', 'Embedded content'), ('canvas', 'Phrasing content'), ('canvas', 'Flow content'), ('cite', 'Palpable content'), ('cite', 'Phrasing content'), ('cite', 'Flow content'), ('code', 'Palpable content'), ('code', 'Phrasing content'), ('code', 'Flow content'), ('data', 'Palpable content'), ('data', 'Phrasing content'), ('data', 'Flow content'), ('datalist', 'Phrasing content'), ('datalist', 'Flow content'), ('del', 'Phrasing content'), ('del', 'Flow content'), ('dfn', 'Palpable content'), ('dfn', 'Phrasing content'), ('dfn', 'Flow content'), ('div', 'Palpable content'), ('div', 'Flow content'), ('dl', 'Flow content'), ('em', 'Palpable content'), ('em', 'Phrasing content'), ('em', 'Flow content'), ('embed', 'Palpable content'), ('embed', 'Interactive content'), ('embed', 'Embedded content'), ('embed', 'Phrasing content'), ('embed', 'Flow content'), ('fieldset', 'Palpable content'), ('fieldset', 'Listed'), ('fieldset', 'Sectioning root'), ('fieldset', 'Flow content'), ('figure', 'Palpable content'), ('figure', 'Sectioning root'), ('figure', 'Flow content'), ('footer', 'Palpable content'), ('footer', 'Flow content'), ('form', 'Palpable content'), ('form', 'Flow content'), ('h1', 'Palpable content'), ('h1', 'Heading content'), ('h1', 'Flow content'), ('h2', 'Palpable content'), ('h2', 'Heading content'), ('h2', 'Flow content'), ('h3', 'Palpable content'), ('h3', 'Heading content'), ('h3', 'Flow content'), ('h4', 'Palpable content'), ('h4', 'Heading content'), ('h4', 'Flow content'), ('h5', 'Palpable content'), ('h5', 'Heading content'), ('h5', 'Flow content'), ('h6', 'Palpable content'), ('h6', 'Heading content'), ('h6', 'Flow content'), ('header', 'Palpable content'), ('header', 'Flow content'), ('hr', 'Flow content'), ('i', 'Palpable content'), ('i', 'Phrasing content'), ('i', 'Flow content'), ('iframe', 'Palpable content'), ('iframe', 'Interactive content'), ('iframe', 'Embedded content'), ('iframe', 'Phrasing content'), ('iframe', 'Flow content'), ('img', 'Palpable content'), ('img', 'Form-associated element'), ('img', 'Embedded content'), ('img', 'Phrasing content'), ('img', 'Flow content'), ('input', 'Phrasing content'), ('input', 'Flow content'), ('ins', 'Palpable content'), ('ins', 'Phrasing content'), ('ins', 'Flow content'), ('kbd', 'Palpable content'), ('kbd', 'Phrasing content'), ('kbd', 'Flow content'), ('keygen', 'Palpable content'), ('keygen', 'Listed'), ('keygen', 'Interactive content'), ('keygen', 'Phrasing content'), ('keygen', 'Flow content'), ('label', 'Palpable content'), ('label', 'Reassociateable'), ('label', 'Interactive content'), ('label', 'Phrasing content'), ('label', 'Flow content'), ('link', 'Metadata content'), ('main', 'Palpable content'), ('main', 'Flow content'), ('map', 'Palpable content'), ('map', 'Phrasing content'), ('map', 'Flow content'), ('mark', 'Palpable content'), ('mark', 'Phrasing content'), ('mark', 'Flow content'), ('meta', 'Metadata content'), ('meter', 'Palpable content'), ('meter', 'Labelable element'), ('meter', 'Phrasing content'), ('meter', 'Flow content'), ('nav', 'Palpable content'), ('nav', 'Sectioning content'), ('nav', 'Flow content'), ('noscript', 'Phrasing content'), ('noscript', 'Flow content'), ('noscript', 'Metadata content'), ('object', 'Palpable content'), ('object', 'Listed'), ('object', 'Embedded content'), ('object', 'Phrasing content'), ('object', 'Flow content'), ('ol', 'Flow content'), ('output', 'Palpable content'), ('output', 'Listed'), ('output', 'Phrasing content'), ('output', 'Flow content'), ('p', 'Palpable content'), ('p', 'Flow content'), ('pre', 'Palpable content'), ('pre', 'Flow content'), ('progress', 'Palpable content'), ('progress', 'Labelable element'), ('progress', 'Phrasing content'), ('progress', 'Flow content'), ('q', 'Palpable content'), ('q', 'Phrasing content'), ('q', 'Flow content'), ('ruby', 'Palpable content'), ('ruby', 'Phrasing content'), ('ruby', 'Flow content'), ('s', 'Palpable content'), ('s', 'Phrasing content'), ('s', 'Flow content'), ('samp', 'Palpable content'), ('samp', 'Phrasing content'), ('samp', 'Flow content'), ('script', 'Script-supporting element'), ('script', 'Phrasing content'), ('script', 'Flow content'), ('script', 'Metadata content'), ('section', 'Palpable content'), ('section', 'Sectioning content'), ('section', 'Flow content'), ('select', 'Palpable content'), ('select', 'Listed'), ('select', 'Interactive content'), ('select', 'Phrasing content'), ('select', 'Flow content'), ('small', 'Palpable content'), ('small', 'Phrasing content'), ('small', 'Flow content'), ('span', 'Palpable content'), ('span', 'Phrasing content'), ('span', 'Flow content'), ('strong', 'Palpable content'), ('strong', 'Phrasing content'), ('strong', 'Flow content'), ('style', 'Metadata content'), ('sub', 'Palpable content'), ('sub', 'Phrasing content'), ('sub', 'Flow content'), ('sup', 'Palpable content'), ('sup', 'Phrasing content'), ('sup', 'Flow content'), ('table', 'Palpable content'), ('table', 'Flow content'), ('td', 'Sectioning root'), ('template', 'Script-supporting element'), ('template', 'Phrasing content'), ('template', 'Flow content'), ('template', 'Metadata content'), ('textarea', 'Palpable content'), ('textarea', 'Listed'), ('textarea', 'Interactive content'), ('textarea', 'Phrasing content'), ('textarea', 'Flow content'), ('time', 'Palpable content'), ('time', 'Phrasing content'), ('time', 'Flow content'), ('title', 'Metadata content'), ('u', 'Palpable content'), ('u', 'Phrasing content'), ('u', 'Flow content'), ('ul', 'Flow content'), ('var', 'Palpable content'), ('var', 'Phrasing content'), ('var', 'Flow content'), ('video', 'Palpable content'), ('video', 'Embedded content'), ('video', 'Phrasing content'), ('video', 'Flow content'), ('wbr', 'Phrasing content'), ('wbr', 'Flow content');

INSERT INTO element_context_category (elt_name, cat_name) VALUES ('a', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('abbr', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('address', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('article', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('aside', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('audio', 'Embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('b', 'Phrasing content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('base', 'head', FALSE, TRUE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('bdi', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('bdo', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('blockquote', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('br', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('button', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('canvas', 'Embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('cite', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('code', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('data', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('datalist', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('del', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('dfn', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('div', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('dl', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('em', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('embed', 'Embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('fieldset', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('figure', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('footer', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('form', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('h1', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('h2', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('h3', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('h4', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('h5', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('h6', 'Flow content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('head', 'html', TRUE, FALSE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('header', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('hr', 'Flow content');
INSERT INTO element_context_subdocument (elt_name) VALUES ('html');
INSERT INTO element_context_root (elt_name) VALUES ('html');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('i', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('iframe', 'Embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('img', 'Embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('input', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('ins', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('kbd', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('keygen', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('label', 'Phrasing content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('legend', 'fieldset', TRUE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('li', 'ul', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('li', 'ol', FALSE, FALSE);
INSERT INTO element_context_subelement (elt_name, ecs_elt, ecs_sub) VALUES ('link', 'noscript', 'head');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('link', 'Metadata content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('map', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('mark', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('meter', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('nav', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('object', 'Embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('ol', 'Flow content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('optgroup', 'select', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('option', 'optgroup', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('option', 'datalist', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('option', 'select', FALSE, FALSE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('output', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('p', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('pre', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('progress', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('q', 'Phrasing content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('rb', 'ruby', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('rtc', 'ruby', FALSE, FALSE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('ruby', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('s', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('samp', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('script', 'Script-supporting element');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('script', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('script', 'Metadata content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('section', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('select', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('small', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('span', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('strong', 'Phrasing content');
INSERT INTO element_context_subelement (elt_name, ecs_elt, ecs_sub) VALUES ('style', 'noscript', 'head');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('style', 'Metadata content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('sub', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('sup', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('table', 'Flow content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('td', 'tr', FALSE, FALSE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('template', 'Script-supporting element');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('template', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('template', 'Metadata content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('textarea', 'Phrasing content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('th', 'tr', FALSE, FALSE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('time', 'Phrasing content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('title', 'head', FALSE, TRUE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('tr', 'tfoot', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('tr', 'tbody', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('tr', 'thead', FALSE, FALSE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('u', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('ul', 'Flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('var', 'Phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('video', 'Embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('wbr', 'Phrasing content');
-- Unparsed :

-- Element meta, context : If the <code data-anolis-xref="attr-meta-name"><a href="#attr-meta-name">name</a></code> attribute is present: where <a href="#metadata-content-0">metadata content</a> is expected.
-- Element meta, context : If the <code data-anolis-xref="attr-meta-http-equiv"><a href="#attr-meta-http-equiv">http-equiv</a></code> attribute is present but not in the <a data-anolis-xref="attr-meta-http-equiv-content-type" href="#attr-meta-http-equiv-content-type">encoding declaration state</a>: in a <code><a href="#the-noscript-element">noscript</a></code> element that is a child of a <code><a href="#the-head-element">head</a></code> element.
-- Element meta, context : If the <code data-anolis-xref="attr-meta-http-equiv"><a href="#attr-meta-http-equiv">http-equiv</a></code> attribute is present but not in the <a data-anolis-xref="attr-meta-http-equiv-content-type" href="#attr-meta-http-equiv-content-type">encoding declaration state</a>: in a <code><a href="#the-head-element">head</a></code> element.
-- Element meta, context : If the <code data-anolis-xref="attr-meta-charset"><a href="#attr-meta-charset">charset</a></code> attribute is present, or if the element's <code data-anolis-xref="attr-meta-http-equiv"><a href="#attr-meta-http-equiv">http-equiv</a></code> attribute is in the <a data-anolis-xref="attr-meta-http-equiv-content-type" href="#attr-meta-http-equiv-content-type">encoding declaration state</a>: in a <code><a href="#the-head-element">head</a></code> element.
-- Element body, context : As the second element in an <code><a href="#the-html-element">html</a></code> element.
-- Element dt, context : Before <code><a href="#the-dd-element">dd</a></code> or <code><a href="#the-dt-element">dt</a></code> elements inside <code><a href="#the-dl-element">dl</a></code> elements.
-- Element dd, context : After <code><a href="#the-dt-element">dt</a></code> or <code><a href="#the-dd-element">dd</a></code> elements inside <code><a href="#the-dl-element">dl</a></code> elements.
-- Element figcaption, context : As the first or last child of a <code><a href="#the-figure-element">figure</a></code> element.
-- Element main, context : Where <a href="#flow-content-1">flow content</a> is expected, but with no <code><a href="#the-article-element">article</a></code>, <code><a href="#the-aside-element">aside</a></code>, 
  --    <code><a href="#the-footer-element">footer</a></code>, <code><a href="#the-header-element">header</a></code> or <code><a href="#the-nav-element">nav</a></code> element ancestors.
-- Element rt, context : As a child of a <code><a href="#the-ruby-element">ruby</a></code> or of an <code><a href="#the-rtc-element">rtc</a></code> element.
-- Element rp, context : 
  --       As a child of a <code><a href="#the-ruby-element">ruby</a></code> element, either immediately before or immediately 
  --       after an  <code><a href="#the-rt-element">rt</a></code> or <code><a href="#the-rtc-element">rtc</a></code> element, but not between <code><a href="#the-rt-element">rt</a></code>
  --       elements.
  --     
-- Element param, context : As a child of an <code><a href="#the-object-element">object</a></code> element, before any <a href="#flow-content-1">flow content</a>.
-- Element source, context : As a child of a <a href="#media-element">media element</a>, before any <a href="#flow-content-1">flow content</a>
  --  or <code><a href="#the-track-element">track</a></code> elements.
-- Element track, context : As a child of a <a href="#media-element">media element</a>, before any <a href="#flow-content-1">flow content</a>.
-- Element area, context : Where <a href="#phrasing-content-1">phrasing content</a> is expected, but only if there is a <code><a href="#the-map-element">map</a></code> element ancestor or a <code><a href="#the-template-element">template</a></code> element ancestor.
-- Element caption, context : As the first element child of a <code><a href="#the-table-element">table</a></code> element.
-- Element colgroup, context : As a child of a <code><a href="#the-table-element">table</a></code> element, after any
  --    <code><a href="#the-caption-element">caption</a></code> elements and before any <code><a href="#the-thead-element">thead</a></code>,
  --    <code><a href="#the-tbody-element">tbody</a></code>, <code><a href="#the-tfoot-element">tfoot</a></code>, and <code><a href="#the-tr-element">tr</a></code>
  --    elements.
-- Element col, context : As a child of a <code><a href="#the-colgroup-element">colgroup</a></code> element that doesn't have
  --    a <code data-anolis-xref="attr-col-span"><a href="#attr-col-span">span</a></code> attribute.
-- Element tbody, context : As a child of a <code><a href="#the-table-element">table</a></code> element, after any
  --    <code><a href="#the-caption-element">caption</a></code>, <code><a href="#the-colgroup-element">colgroup</a></code>, and
  --    <code><a href="#the-thead-element">thead</a></code> elements, but only if there are no
  --    <code><a href="#the-tr-element">tr</a></code> elements that are children of the
  --    <code><a href="#the-table-element">table</a></code> element.
-- Element thead, context : As a child of a <code><a href="#the-table-element">table</a></code> element, after any
  --    <code><a href="#the-caption-element">caption</a></code>, and <code><a href="#the-colgroup-element">colgroup</a></code>
  --    elements and before any <code><a href="#the-tbody-element">tbody</a></code>, <code><a href="#the-tfoot-element">tfoot</a></code>, and
  --    <code><a href="#the-tr-element">tr</a></code> elements, but only if there are no other
  --    <code><a href="#the-thead-element">thead</a></code> elements that are children of the
  --    <code><a href="#the-table-element">table</a></code> element.
-- Element tfoot, context : As a child of a <code><a href="#the-table-element">table</a></code> element, after any
  --    <code><a href="#the-caption-element">caption</a></code>, <code><a href="#the-colgroup-element">colgroup</a></code>, <code><a href="#the-thead-element">thead</a></code>,
  --    <code><a href="#the-tbody-element">tbody</a></code>, and <code><a href="#the-tr-element">tr</a></code> elements, but only if there
  --    are no other <code><a href="#the-tfoot-element">tfoot</a></code> elements that are children of the
  --    <code><a href="#the-table-element">table</a></code> element.
-- Element tfoot, context : As a child of a <code><a href="#the-table-element">table</a></code> element, after any
  --    <code><a href="#the-caption-element">caption</a></code>, <code><a href="#the-colgroup-element">colgroup</a></code>, and <code><a href="#the-thead-element">thead</a></code>
  --    elements and before any <code><a href="#the-tbody-element">tbody</a></code> and <code><a href="#the-tr-element">tr</a></code>
  --    elements, but only if there are no other <code><a href="#the-tfoot-element">tfoot</a></code>
  --    elements that are children of the <code><a href="#the-table-element">table</a></code> element.
-- Element tr, context : As a child of a <code><a href="#the-table-element">table</a></code> element, after any
  --    <code><a href="#the-caption-element">caption</a></code>, <code><a href="#the-colgroup-element">colgroup</a></code>, and <code><a href="#the-thead-element">thead</a></code>
  --    elements, but only if there are no <code><a href="#the-tbody-element">tbody</a></code> elements that
  --    are children of the <code><a href="#the-table-element">table</a></code> element.
-- Element noscript, context : Where <a href="#phrasing-content-1">phrasing content</a> is expected in <a href="#html-documents">HTML documents</a>, if there are no ancestor <code><a href="#the-noscript-element">noscript</a></code> elements.
-- Element noscript, context : In a <code><a href="#the-head-element">head</a></code> element of an <a data-anolis-xref="HTML documents" href="#html-documents">HTML document</a>, if there are no ancestor <code><a href="#the-noscript-element">noscript</a></code> elements.
-- Element template, context : As a child of a <code><a href="#the-colgroup-element">colgroup</a></code> element that doesn't have a <code data-anolis-xref="attr-colgroup-span"><a href="#attr-colgroup-span">span</a></code> attribute.
-- Element ol, category : If the element's children include at least one <code><a href="#the-li-element">li</a></code> element: <a href="#palpable-content-0">Palpable content</a>.
-- Element ul, category : If the element's children include at least one <code><a href="#the-li-element">li</a></code> element: <a href="#palpable-content-0">Palpable content</a>.
-- Element dl, category : If the element's children include at least one name-value group: <a href="#palpable-content-0">Palpable content</a>.
-- Element img, category : If the element has a <code data-anolis-xref="attr-hyperlink-usemap"><a href="#attr-hyperlink-usemap">usemap</a></code> attribute: <a href="#interactive-content-0">Interactive content</a>.
-- Element object, category : If the element has a <code data-anolis-xref="attr-hyperlink-usemap"><a href="#attr-hyperlink-usemap">usemap</a></code> attribute: <a href="#interactive-content-0">Interactive content</a>.
-- Element video, category : If the element has a <code data-anolis-xref="attr-media-controls"><a href="#attr-media-controls">controls</a></code> attribute: <a href="#interactive-content-0">Interactive content</a>.
-- Element audio, category : If the element has a <code data-anolis-xref="attr-media-controls"><a href="#attr-media-controls">controls</a></code> attribute: <a href="#palpable-content-0">Palpable content</a>.
-- Element audio, category : If the element has a <code data-anolis-xref="attr-media-controls"><a href="#attr-media-controls">controls</a></code> attribute: <a href="#interactive-content-0">Interactive content</a>.
-- Element input, category : If the <code data-anolis-xref="attr-input-type"><a href="#attr-input-type">type</a></code> attribute is <em>not</em> in the <a data-anolis-xref="attr-input-type-hidden" href="#hidden-state-(type=hidden)">Hidden</a> state: <a href="#palpable-content-0">Palpable content</a>.
-- Element input, category : If the <code data-anolis-xref="attr-input-type"><a href="#attr-input-type">type</a></code> attribute is in the <a data-anolis-xref="attr-input-type-hidden" href="#hidden-state-(type=hidden)">Hidden</a> state: <a data-anolis-xref="category-listed" href="#category-listed">Listed</a>, <a data-anolis-xref="category-submit" href="#category-submit">submittable</a>, <a data-anolis-xref="category-reset" href="#category-reset">resettable</a>, and <a data-anolis-xref="category-form-attr" href="#category-form-attr">reassociateable</a> <a href="#form-associated-element">form-associated element</a>.
-- Element input, category : If the <code data-anolis-xref="attr-input-type"><a href="#attr-input-type">type</a></code> attribute is <em>not</em> in the <a data-anolis-xref="attr-input-type-hidden" href="#hidden-state-(type=hidden)">Hidden</a> state: <a data-anolis-xref="category-listed" href="#category-listed">Listed</a>, <a data-anolis-xref="category-label" href="#category-label">labelable</a>, <a data-anolis-xref="category-submit" href="#category-submit">submittable</a>, <a data-anolis-xref="category-reset" href="#category-reset">resettable</a>, and <a data-anolis-xref="category-form-attr" href="#category-form-attr">reassociateable</a> <a href="#form-associated-element">form-associated element</a>.
-- Element input, category : If the <code data-anolis-xref="attr-input-type"><a href="#attr-input-type">type</a></code> attribute is <em>not</em> in the <a data-anolis-xref="attr-input-type-hidden" href="#hidden-state-(type=hidden)">Hidden</a> state: <a href="#interactive-content-0">Interactive content</a>.
