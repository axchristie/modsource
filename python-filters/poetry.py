#!/usr/bin/python
from pandocfilters import toJSONFilter, RawInline, RawBlock

def latex(s):
    return RawBlock('latex', s)

def html(s):
    return RawBlock('html', s)

def extractPoetry(key, value, format, meta):

    if key == 'Div': 
        [[ident, classes, kvs], contents] = value

        if 'poetry' in classes:

            if format == 'latex':
                return ([latex('\n\\begin{verse} \n')] + contents + [latex('\n\\end{verse} \n')])

            if format == 'html':
                return ([html('\n <div class="poetry">\n')] + contents + [html('\n</div>\n')])

    return 


def myemph(k, v, f, meta):
    if k == 'Emph' and f == 'latex':
        return [latex('\\myemph{')] + v + [latex('}')]


if __name__ == "__main__":
  toJSONFilter(extractPoetry)


