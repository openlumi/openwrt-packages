#!/bin/bash

function generate_html_index() {
  INDEX_FILE=$1/index.html
  CONTENT='<html><head>
    <style type="text/css">
    html, body {
      margin: 0;
      padding: 0;
      height: 100%;
    }
    body {
      color: #333;
      padding-top: 2em;
      font-family: Helvetica,Arial,sans-serif;
      width: 90%;
      min-width: 700px;
      max-width: 1100px;
      margin: auto;
      font-size: 120%;
      background-color: #ddd;
    }
    h1 {
      font-size: 120%;
      line-height: 1em;
    }
    h2 {
      font-size: 100%;
      line-height: 1em;
    }
    table {
      width: 100%;
      box-shadow: 0 0 0.5em #999;
      margin: 0;
      border: none !important;
      margin-bottom: 2em;
      border-collapse: collapse;
      border-spacing: 0;
    }
    th {
      background: #000;
      background: -webkit-linear-gradient(top, #444, #000);
      background: -moz-linear-gradient(top, #444, #000);
      background: -ms-linear-gradient(top, #444, #000);
      background: -o-linear-gradient(top, #444, #000);
      background: linear-gradient(top, #444, #000);
      font-size: 14px;
      line-height: 24px;
      border: none;
      text-align: left;
      color: #fff;
    }
    tr {
      background: rgba(255, 255, 255, 0.8);
    }
    tr:hover {
      background: rgba(255, 255, 255, 0.6);
    }
    p, th, td {
      font-size: 14px;
    }
    th, td {
      height: 20px;
      vertical-align: middle;
      white-space: nowrap;
      padding: 0.2em 0.5em;
      border: 1px solid #ccc;
    }
    a:link, a:visited {
      color: #337ab7;
      font-weight: bold;
      text-decoration: none;
    }
    a:hover, a:active, a:focus {
      color: #23527c;
      text-decoration: underline;
    }
    .s {
      text-align: right;
      width: 15%;
    }
    .d {
      text-align: center;
      width: 15%;
    }
    .sh {
      font-family: monospace;
    }
    </style>
    <body>
    <h1>Index of <a href="/"><em>(root)</em></a> / <a href="../">..</a> /
    </h1>

    <table>
    <tr><th class="n">File Name</th><th class="s">File Size</th><th class="d">Date</th></tr>
    '
  for filepath in `find "$1" -maxdepth 1 -mindepth 1  -type d| sort`; do
    base_path=`basename "$filepath"`
    CONTENT+='<tr><td class="n"><a href="'$base_path'">'$base_path'</a></td><td class="s">-</td><td
    class="d">-</td></tr>'
  done

  for i in `find "$1" -mindepth 1 -maxdepth 1 \
      -type f \( ! -iname ".*" ! -iname "index.html" \) | sort`; do

      file=`basename "$i"`
      file_size=`du -h "$i" | cut -f1`
      file_modify_time=`stat  --printf="%y" $i`

      CONTENT+='<tr>'
      CONTENT+='<td class="n"><a href="./'$file'">'$file'</a></td>'
      CONTENT+='<td class="s">'$file_size'</td>'
      CONTENT+='<td class="d">'$file_modify_time'</td>'
      CONTENT+='</tr>'
  done

  CONTENT+='</table>
  </body></html>'
  echo $CONTENT > $INDEX_FILE
  echo $INDEX_FILE
}

for directory in `find "$1"  -type d| sort`; do
  echo $directory
  generate_html_index $directory
done
