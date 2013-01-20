#!/bin/bash

{
echo "<html><body>" ;

sed \
-e 's/&/\&amp;/g' \
-e 's/\"/\&quot;/g' \
-e 's/</\&lt;/g' \
-e 's/>/\&gt;/g' \
-e '/^Part/! s/$/<\/br>/' \
-e 's/^Part.*$/<h1>&<\/h1>/' \
$1 ;

echo "";
echo "</body></html>" 
}