INSERT INTO element (elt_name) VALUES ('a'), ('abbr'), ('address'), ('area'), ('article'), ('aside'), ('audio'), ('b'), ('base'), ('bdi'), ('bdo'), ('blockquote'), ('body'), ('br'), ('button'), ('canvas'), ('caption'), ('cite'), ('code'), ('col'), ('colgroup'), ('data'), ('datalist'), ('dd'), ('del'), ('dfn'), ('div'), ('dl'), ('dt'), ('em'), ('embed'), ('fieldset'), ('figcaption'), ('figure'), ('footer'), ('form'), ('h1'), ('h2'), ('h3'), ('h4'), ('h5'), ('h6'), ('head'), ('header'), ('hr'), ('html'), ('i'), ('iframe'), ('img'), ('input'), ('ins'), ('kbd'), ('keygen'), ('label'), ('legend'), ('li'), ('link'), ('main'), ('map'), ('mark'), ('meta'), ('meter'), ('nav'), ('noscript'), ('object'), ('ol'), ('optgroup'), ('option'), ('output'), ('p'), ('param'), ('pre'), ('progress'), ('q'), ('rb'), ('rp'), ('rt'), ('rtc'), ('ruby'), ('s'), ('samp'), ('script'), ('section'), ('select'), ('small'), ('source'), ('span'), ('strong'), ('style'), ('sub'), ('sup'), ('table'), ('tbody'), ('td'), ('template'), ('textarea'), ('tfoot'), ('th'), ('thead'), ('time'), ('title'), ('tr'), ('track'), ('u'), ('ul'), ('var'), ('video'), ('wbr');

INSERT INTO category (cat_name) VALUES ('Embedded content'), ('Flow content'), ('Form-associated element'), ('Heading content'), ('Interactive content'), ('Labelable element'), ('Listed'), ('Metadata content'), ('Palpable content'), ('Phrasing content'), ('Reassociateable'), ('Script-supporting element'), ('Sectioning content'), ('Sectioning root');

INSERT INTO element_category (elt_name, cat_name, elc_has_elt) VALUES ('a', 'Palpable content', NULL), ('a', 'Interactive content', NULL), ('a', 'Phrasing content', NULL), ('a', 'Flow content', NULL), ('abbr', 'Palpable content', NULL), ('abbr', 'Phrasing content', NULL), ('abbr', 'Flow content', NULL), ('address', 'Palpable content', NULL), ('address', 'Flow content', NULL), ('area', 'Phrasing content', NULL), ('area', 'Flow content', NULL), ('article', 'Palpable content', NULL), ('article', 'Sectioning content', NULL), ('article', 'Flow content', NULL), ('aside', 'Palpable content', NULL), ('aside', 'Sectioning content', NULL), ('aside', 'Flow content', NULL), ('audio', 'Embedded content', NULL), ('audio', 'Phrasing content', NULL), ('audio', 'Flow content', NULL), ('b', 'Palpable content', NULL), ('b', 'Phrasing content', NULL), ('b', 'Flow content', NULL), ('base', 'Metadata content', NULL), ('bdi', 'Palpable content', NULL), ('bdi', 'Phrasing content', NULL), ('bdi', 'Flow content', NULL), ('bdo', 'Palpable content', NULL), ('bdo', 'Phrasing content', NULL), ('bdo', 'Flow content', NULL), ('blockquote', 'Palpable content', NULL), ('blockquote', 'Sectioning root', NULL), ('blockquote', 'Flow content', NULL), ('body', 'Sectioning root', NULL), ('br', 'Phrasing content', NULL), ('br', 'Flow content', NULL), ('button', 'Palpable content', NULL), ('button', 'Listed', NULL), ('button', 'Interactive content', NULL), ('button', 'Phrasing content', NULL), ('button', 'Flow content', NULL), ('canvas', 'Palpable content', NULL), ('canvas', 'Embedded content', NULL), ('canvas', 'Phrasing content', NULL), ('canvas', 'Flow content', NULL), ('cite', 'Palpable content', NULL), ('cite', 'Phrasing content', NULL), ('cite', 'Flow content', NULL), ('code', 'Palpable content', NULL), ('code', 'Phrasing content', NULL), ('code', 'Flow content', NULL), ('data', 'Palpable content', NULL), ('data', 'Phrasing content', NULL), ('data', 'Flow content', NULL), ('datalist', 'Phrasing content', NULL), ('datalist', 'Flow content', NULL), ('del', 'Phrasing content', NULL), ('del', 'Flow content', NULL), ('dfn', 'Palpable content', NULL), ('dfn', 'Phrasing content', NULL), ('dfn', 'Flow content', NULL), ('div', 'Palpable content', NULL), ('div', 'Flow content', NULL), ('dl', 'Palpable content', '{dt, dd}'), ('dl', 'Flow content', NULL), ('em', 'Palpable content', NULL), ('em', 'Phrasing content', NULL), ('em', 'Flow content', NULL), ('embed', 'Palpable content', NULL), ('embed', 'Interactive content', NULL), ('embed', 'Embedded content', NULL), ('embed', 'Phrasing content', NULL), ('embed', 'Flow content', NULL), ('fieldset', 'Palpable content', NULL), ('fieldset', 'Listed', NULL), ('fieldset', 'Sectioning root', NULL), ('fieldset', 'Flow content', NULL), ('figure', 'Palpable content', NULL), ('figure', 'Sectioning root', NULL), ('figure', 'Flow content', NULL), ('footer', 'Palpable content', NULL), ('footer', 'Flow content', NULL), ('form', 'Palpable content', NULL), ('form', 'Flow content', NULL), ('h1', 'Palpable content', NULL), ('h1', 'Heading content', NULL), ('h1', 'Flow content', NULL), ('h2', 'Palpable content', NULL), ('h2', 'Heading content', NULL), ('h2', 'Flow content', NULL), ('h3', 'Palpable content', NULL), ('h3', 'Heading content', NULL), ('h3', 'Flow content', NULL), ('h4', 'Palpable content', NULL), ('h4', 'Heading content', NULL), ('h4', 'Flow content', NULL), ('h5', 'Palpable content', NULL), ('h5', 'Heading content', NULL), ('h5', 'Flow content', NULL), ('h6', 'Palpable content', NULL), ('h6', 'Heading content', NULL), ('h6', 'Flow content', NULL), ('header', 'Palpable content', NULL), ('header', 'Flow content', NULL), ('hr', 'Flow content', NULL), ('i', 'Palpable content', NULL), ('i', 'Phrasing content', NULL), ('i', 'Flow content', NULL), ('iframe', 'Palpable content', NULL), ('iframe', 'Interactive content', NULL), ('iframe', 'Embedded content', NULL), ('iframe', 'Phrasing content', NULL), ('iframe', 'Flow content', NULL), ('img', 'Palpable content', NULL), ('img', 'Form-associated element', NULL), ('img', 'Embedded content', NULL), ('img', 'Phrasing content', NULL), ('img', 'Flow content', NULL), ('input', 'Phrasing content', NULL), ('input', 'Flow content', NULL), ('ins', 'Palpable content', NULL), ('ins', 'Phrasing content', NULL), ('ins', 'Flow content', NULL), ('kbd', 'Palpable content', NULL), ('kbd', 'Phrasing content', NULL), ('kbd', 'Flow content', NULL), ('keygen', 'Palpable content', NULL), ('keygen', 'Listed', NULL), ('keygen', 'Interactive content', NULL), ('keygen', 'Phrasing content', NULL), ('keygen', 'Flow content', NULL), ('label', 'Palpable content', NULL), ('label', 'Reassociateable', NULL), ('label', 'Interactive content', NULL), ('label', 'Phrasing content', NULL), ('label', 'Flow content', NULL), ('link', 'Metadata content', NULL), ('main', 'Palpable content', NULL), ('main', 'Flow content', NULL), ('map', 'Palpable content', NULL), ('map', 'Phrasing content', NULL), ('map', 'Flow content', NULL), ('mark', 'Palpable content', NULL), ('mark', 'Phrasing content', NULL), ('mark', 'Flow content', NULL), ('meta', 'Metadata content', NULL), ('meter', 'Palpable content', NULL), ('meter', 'Labelable element', NULL), ('meter', 'Phrasing content', NULL), ('meter', 'Flow content', NULL), ('nav', 'Palpable content', NULL), ('nav', 'Sectioning content', NULL), ('nav', 'Flow content', NULL), ('noscript', 'Phrasing content', NULL), ('noscript', 'Flow content', NULL), ('noscript', 'Metadata content', NULL), ('object', 'Palpable content', NULL), ('object', 'Listed', NULL), ('object', 'Embedded content', NULL), ('object', 'Phrasing content', NULL), ('object', 'Flow content', NULL), ('ol', 'Palpable content', '{li}'), ('ol', 'Flow content', NULL), ('output', 'Palpable content', NULL), ('output', 'Listed', NULL), ('output', 'Phrasing content', NULL), ('output', 'Flow content', NULL), ('p', 'Palpable content', NULL), ('p', 'Flow content', NULL), ('pre', 'Palpable content', NULL), ('pre', 'Flow content', NULL), ('progress', 'Palpable content', NULL), ('progress', 'Labelable element', NULL), ('progress', 'Phrasing content', NULL), ('progress', 'Flow content', NULL), ('q', 'Palpable content', NULL), ('q', 'Phrasing content', NULL), ('q', 'Flow content', NULL), ('ruby', 'Palpable content', NULL), ('ruby', 'Phrasing content', NULL), ('ruby', 'Flow content', NULL), ('s', 'Palpable content', NULL), ('s', 'Phrasing content', NULL), ('s', 'Flow content', NULL), ('samp', 'Palpable content', NULL), ('samp', 'Phrasing content', NULL), ('samp', 'Flow content', NULL), ('script', 'Script-supporting element', NULL), ('script', 'Phrasing content', NULL), ('script', 'Flow content', NULL), ('script', 'Metadata content', NULL), ('section', 'Palpable content', NULL), ('section', 'Sectioning content', NULL), ('section', 'Flow content', NULL), ('select', 'Palpable content', NULL), ('select', 'Listed', NULL), ('select', 'Interactive content', NULL), ('select', 'Phrasing content', NULL), ('select', 'Flow content', NULL), ('small', 'Palpable content', NULL), ('small', 'Phrasing content', NULL), ('small', 'Flow content', NULL), ('span', 'Palpable content', NULL), ('span', 'Phrasing content', NULL), ('span', 'Flow content', NULL), ('strong', 'Palpable content', NULL), ('strong', 'Phrasing content', NULL), ('strong', 'Flow content', NULL), ('style', 'Metadata content', NULL), ('sub', 'Palpable content', NULL), ('sub', 'Phrasing content', NULL), ('sub', 'Flow content', NULL), ('sup', 'Palpable content', NULL), ('sup', 'Phrasing content', NULL), ('sup', 'Flow content', NULL), ('table', 'Palpable content', NULL), ('table', 'Flow content', NULL), ('td', 'Sectioning root', NULL), ('template', 'Script-supporting element', NULL), ('template', 'Phrasing content', NULL), ('template', 'Flow content', NULL), ('template', 'Metadata content', NULL), ('textarea', 'Palpable content', NULL), ('textarea', 'Listed', NULL), ('textarea', 'Interactive content', NULL), ('textarea', 'Phrasing content', NULL), ('textarea', 'Flow content', NULL), ('time', 'Palpable content', NULL), ('time', 'Phrasing content', NULL), ('time', 'Flow content', NULL), ('title', 'Metadata content', NULL), ('u', 'Palpable content', NULL), ('u', 'Phrasing content', NULL), ('u', 'Flow content', NULL), ('ul', 'Palpable content', '{li}'), ('ul', 'Flow content', NULL), ('var', 'Palpable content', NULL), ('var', 'Phrasing content', NULL), ('var', 'Flow content', NULL), ('video', 'Palpable content', NULL), ('video', 'Embedded content', NULL), ('video', 'Phrasing content', NULL), ('video', 'Flow content', NULL), ('wbr', 'Phrasing content', NULL), ('wbr', 'Flow content', NULL);

INSERT INTO element_context_category (elt_name, cat_name) VALUES ('a', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('abbr', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('address', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('article', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('aside', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('audio', 'embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('b', 'phrasing content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('base', 'head', FALSE, TRUE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('bdi', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('bdo', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('blockquote', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('br', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('button', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('canvas', 'embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('cite', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('code', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('data', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('datalist', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('del', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('dfn', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('div', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('dl', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('em', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('embed', 'embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('fieldset', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('figure', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('footer', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('form', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('h1', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('h2', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('h3', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('h4', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('h5', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('h6', 'flow content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('head', 'html', TRUE, FALSE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('header', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('hr', 'flow content');
INSERT INTO element_context_subdocument (elt_name) VALUES ('html');
INSERT INTO element_context_root (elt_name) VALUES ('html');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('i', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('iframe', 'embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('img', 'embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('input', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('ins', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('kbd', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('keygen', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('label', 'phrasing content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('legend', 'fieldset', TRUE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('li', 'ul', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('li', 'ol', FALSE, FALSE);
INSERT INTO element_context_subelement (elt_name, ecs_elt, ecs_sub) VALUES ('link', 'noscript', 'head');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('link', 'metadata content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('map', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('mark', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('meter', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('nav', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('object', 'embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('ol', 'flow content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('optgroup', 'select', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('option', 'optgroup', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('option', 'datalist', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('option', 'select', FALSE, FALSE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('output', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('p', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('pre', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('progress', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('q', 'phrasing content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('rb', 'ruby', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('rtc', 'ruby', FALSE, FALSE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('ruby', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('s', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('samp', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('script', 'script-supporting element');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('script', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('script', 'metadata content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('section', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('select', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('small', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('span', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('strong', 'phrasing content');
INSERT INTO element_context_subelement (elt_name, ecs_elt, ecs_sub) VALUES ('style', 'noscript', 'head');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('style', 'metadata content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('sub', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('sup', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('table', 'flow content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('td', 'tr', FALSE, FALSE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('template', 'script-supporting element');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('template', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('template', 'metadata content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('textarea', 'phrasing content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('th', 'tr', FALSE, FALSE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('time', 'phrasing content');
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('title', 'head', FALSE, TRUE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('tr', 'tfoot', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('tr', 'tbody', FALSE, FALSE);
INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('tr', 'thead', FALSE, FALSE);
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('u', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('ul', 'flow content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('var', 'phrasing content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('video', 'embedded content');
INSERT INTO element_context_category (elt_name, cat_name) VALUES ('wbr', 'phrasing content');
INSERT INTO unparsed (elt_name, unp_section, unp_text) VALUES
('meta', 'context', 'If the <code data-anolis-xref="attr-meta-name"><a href="#attr-meta-name">name</a></code> attribute is present: where <a href="#metadata-content-0">metadata content</a> is expected.')
, ('meta', 'context', 'If the <code data-anolis-xref="attr-meta-http-equiv"><a href="#attr-meta-http-equiv">http-equiv</a></code> attribute is present but not in the <a data-anolis-xref="attr-meta-http-equiv-content-type" href="#attr-meta-http-equiv-content-type">encoding declaration state</a>: in a <code><a href="#the-noscript-element">noscript</a></code> element that is a child of a <code><a href="#the-head-element">head</a></code> element.')
, ('meta', 'context', 'If the <code data-anolis-xref="attr-meta-http-equiv"><a href="#attr-meta-http-equiv">http-equiv</a></code> attribute is present but not in the <a data-anolis-xref="attr-meta-http-equiv-content-type" href="#attr-meta-http-equiv-content-type">encoding declaration state</a>: in a <code><a href="#the-head-element">head</a></code> element.')
, ('meta', 'context', 'If the <code data-anolis-xref="attr-meta-charset"><a href="#attr-meta-charset">charset</a></code> attribute is present, or if the element''s <code data-anolis-xref="attr-meta-http-equiv"><a href="#attr-meta-http-equiv">http-equiv</a></code> attribute is in the <a data-anolis-xref="attr-meta-http-equiv-content-type" href="#attr-meta-http-equiv-content-type">encoding declaration state</a>: in a <code><a href="#the-head-element">head</a></code> element.')
, ('body', 'context', 'As the second element in an <code><a href="#the-html-element">html</a></code> element.')
, ('dt', 'context', 'Before <code><a href="#the-dd-element">dd</a></code> or <code><a href="#the-dt-element">dt</a></code> elements inside <code><a href="#the-dl-element">dl</a></code> elements.')
, ('dd', 'context', 'After <code><a href="#the-dt-element">dt</a></code> or <code><a href="#the-dd-element">dd</a></code> elements inside <code><a href="#the-dl-element">dl</a></code> elements.')
, ('figcaption', 'context', 'As the first or last child of a <code><a href="#the-figure-element">figure</a></code> element.')
, ('main', 'context', 'Where <a href="#flow-content-1">flow content</a> is expected, but with no <code><a href="#the-article-element">article</a></code>, <code><a href="#the-aside-element">aside</a></code>, 
   <code><a href="#the-footer-element">footer</a></code>, <code><a href="#the-header-element">header</a></code> or <code><a href="#the-nav-element">nav</a></code> element ancestors.')
, ('rt', 'context', 'As a child of a <code><a href="#the-ruby-element">ruby</a></code> or of an <code><a href="#the-rtc-element">rtc</a></code> element.')
, ('rp', 'context', '
      As a child of a <code><a href="#the-ruby-element">ruby</a></code> element, either immediately before or immediately 
      after an  <code><a href="#the-rt-element">rt</a></code> or <code><a href="#the-rtc-element">rtc</a></code> element, but not between <code><a href="#the-rt-element">rt</a></code>
      elements.
    ')
, ('param', 'context', 'As a child of an <code><a href="#the-object-element">object</a></code> element, before any <a href="#flow-content-1">flow content</a>.')
, ('source', 'context', 'As a child of a <a href="#media-element">media element</a>, before any <a href="#flow-content-1">flow content</a>
 or <code><a href="#the-track-element">track</a></code> elements.')
, ('track', 'context', 'As a child of a <a href="#media-element">media element</a>, before any <a href="#flow-content-1">flow content</a>.')
, ('area', 'context', 'Where <a href="#phrasing-content-1">phrasing content</a> is expected, but only if there is a <code><a href="#the-map-element">map</a></code> element ancestor or a <code><a href="#the-template-element">template</a></code> element ancestor.')
, ('caption', 'context', 'As the first element child of a <code><a href="#the-table-element">table</a></code> element.')
, ('colgroup', 'context', 'As a child of a <code><a href="#the-table-element">table</a></code> element, after any
   <code><a href="#the-caption-element">caption</a></code> elements and before any <code><a href="#the-thead-element">thead</a></code>,
   <code><a href="#the-tbody-element">tbody</a></code>, <code><a href="#the-tfoot-element">tfoot</a></code>, and <code><a href="#the-tr-element">tr</a></code>
   elements.')
, ('col', 'context', 'As a child of a <code><a href="#the-colgroup-element">colgroup</a></code> element that doesn''t have
   a <code data-anolis-xref="attr-col-span"><a href="#attr-col-span">span</a></code> attribute.')
, ('tbody', 'context', 'As a child of a <code><a href="#the-table-element">table</a></code> element, after any
   <code><a href="#the-caption-element">caption</a></code>, <code><a href="#the-colgroup-element">colgroup</a></code>, and
   <code><a href="#the-thead-element">thead</a></code> elements, but only if there are no
   <code><a href="#the-tr-element">tr</a></code> elements that are children of the
   <code><a href="#the-table-element">table</a></code> element.')
, ('thead', 'context', 'As a child of a <code><a href="#the-table-element">table</a></code> element, after any
   <code><a href="#the-caption-element">caption</a></code>, and <code><a href="#the-colgroup-element">colgroup</a></code>
   elements and before any <code><a href="#the-tbody-element">tbody</a></code>, <code><a href="#the-tfoot-element">tfoot</a></code>, and
   <code><a href="#the-tr-element">tr</a></code> elements, but only if there are no other
   <code><a href="#the-thead-element">thead</a></code> elements that are children of the
   <code><a href="#the-table-element">table</a></code> element.')
, ('tfoot', 'context', 'As a child of a <code><a href="#the-table-element">table</a></code> element, after any
   <code><a href="#the-caption-element">caption</a></code>, <code><a href="#the-colgroup-element">colgroup</a></code>, <code><a href="#the-thead-element">thead</a></code>,
   <code><a href="#the-tbody-element">tbody</a></code>, and <code><a href="#the-tr-element">tr</a></code> elements, but only if there
   are no other <code><a href="#the-tfoot-element">tfoot</a></code> elements that are children of the
   <code><a href="#the-table-element">table</a></code> element.')
, ('tfoot', 'context', 'As a child of a <code><a href="#the-table-element">table</a></code> element, after any
   <code><a href="#the-caption-element">caption</a></code>, <code><a href="#the-colgroup-element">colgroup</a></code>, and <code><a href="#the-thead-element">thead</a></code>
   elements and before any <code><a href="#the-tbody-element">tbody</a></code> and <code><a href="#the-tr-element">tr</a></code>
   elements, but only if there are no other <code><a href="#the-tfoot-element">tfoot</a></code>
   elements that are children of the <code><a href="#the-table-element">table</a></code> element.')
, ('tr', 'context', 'As a child of a <code><a href="#the-table-element">table</a></code> element, after any
   <code><a href="#the-caption-element">caption</a></code>, <code><a href="#the-colgroup-element">colgroup</a></code>, and <code><a href="#the-thead-element">thead</a></code>
   elements, but only if there are no <code><a href="#the-tbody-element">tbody</a></code> elements that
   are children of the <code><a href="#the-table-element">table</a></code> element.')
, ('noscript', 'context', 'Where <a href="#phrasing-content-1">phrasing content</a> is expected in <a href="#html-documents">HTML documents</a>, if there are no ancestor <code><a href="#the-noscript-element">noscript</a></code> elements.')
, ('noscript', 'context', 'In a <code><a href="#the-head-element">head</a></code> element of an <a data-anolis-xref="HTML documents" href="#html-documents">HTML document</a>, if there are no ancestor <code><a href="#the-noscript-element">noscript</a></code> elements.')
, ('template', 'context', 'As a child of a <code><a href="#the-colgroup-element">colgroup</a></code> element that doesn''t have a <code data-anolis-xref="attr-colgroup-span"><a href="#attr-colgroup-span">span</a></code> attribute.')
, ('img', 'category', 'If the element has a <code data-anolis-xref="attr-hyperlink-usemap"><a href="#attr-hyperlink-usemap">usemap</a></code> attribute: <a href="#interactive-content-0">Interactive content</a>.')
, ('object', 'category', 'If the element has a <code data-anolis-xref="attr-hyperlink-usemap"><a href="#attr-hyperlink-usemap">usemap</a></code> attribute: <a href="#interactive-content-0">Interactive content</a>.')
, ('video', 'category', 'If the element has a <code data-anolis-xref="attr-media-controls"><a href="#attr-media-controls">controls</a></code> attribute: <a href="#interactive-content-0">Interactive content</a>.')
, ('audio', 'category', 'If the element has a <code data-anolis-xref="attr-media-controls"><a href="#attr-media-controls">controls</a></code> attribute: <a href="#palpable-content-0">Palpable content</a>.')
, ('audio', 'category', 'If the element has a <code data-anolis-xref="attr-media-controls"><a href="#attr-media-controls">controls</a></code> attribute: <a href="#interactive-content-0">Interactive content</a>.')
, ('input', 'category', 'If the <code data-anolis-xref="attr-input-type"><a href="#attr-input-type">type</a></code> attribute is <em>not</em> in the <a data-anolis-xref="attr-input-type-hidden" href="#hidden-state-(type=hidden)">Hidden</a> state: <a href="#palpable-content-0">Palpable content</a>.')
, ('input', 'category', 'If the <code data-anolis-xref="attr-input-type"><a href="#attr-input-type">type</a></code> attribute is in the <a data-anolis-xref="attr-input-type-hidden" href="#hidden-state-(type=hidden)">Hidden</a> state: <a data-anolis-xref="category-listed" href="#category-listed">Listed</a>, <a data-anolis-xref="category-submit" href="#category-submit">submittable</a>, <a data-anolis-xref="category-reset" href="#category-reset">resettable</a>, and <a data-anolis-xref="category-form-attr" href="#category-form-attr">reassociateable</a> <a href="#form-associated-element">form-associated element</a>.')
, ('input', 'category', 'If the <code data-anolis-xref="attr-input-type"><a href="#attr-input-type">type</a></code> attribute is <em>not</em> in the <a data-anolis-xref="attr-input-type-hidden" href="#hidden-state-(type=hidden)">Hidden</a> state: <a data-anolis-xref="category-listed" href="#category-listed">Listed</a>, <a data-anolis-xref="category-label" href="#category-label">labelable</a>, <a data-anolis-xref="category-submit" href="#category-submit">submittable</a>, <a data-anolis-xref="category-reset" href="#category-reset">resettable</a>, and <a data-anolis-xref="category-form-attr" href="#category-form-attr">reassociateable</a> <a href="#form-associated-element">form-associated element</a>.')
, ('input', 'category', 'If the <code data-anolis-xref="attr-input-type"><a href="#attr-input-type">type</a></code> attribute is <em>not</em> in the <a data-anolis-xref="attr-input-type-hidden" href="#hidden-state-(type=hidden)">Hidden</a> state: <a href="#interactive-content-0">Interactive content</a>.')
;

