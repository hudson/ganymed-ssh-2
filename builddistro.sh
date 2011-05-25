#!/bin/sh

# ------------------------------------------------------------------------
# GANYMED SSH-2 FOR JAVA BUILD SCRIPT
# (C) 2005-2011 Christian Plattner
# ------------------------------------------------------------------------
# Please adjust the following:
# ------------------------------------------------------------------------

DIST=ganymed-ssh2-build251beta1
JAVADOC=/opt/jdk1.6.0_18/bin/javadoc
JAR=/opt/jdk1.6.0_18/bin/jar

# ------------------------------------------------------------------------
# No need to adjust anything below
# ------------------------------------------------------------------------

echo "Building Distro $DIST"

if [ -d "$DIST" ]
then
	echo "Directory $DIST already exists!"
	exit 1
fi

mkdir $DIST

cp -R src $DIST
cp -R examples $DIST
cp LICENSE.txt $DIST
cp HISTORY.txt $DIST
cp README.txt $DIST

mkdir $DIST/faq
cp FAQ.html $DIST/faq

mkdir $DIST/javadoc

$JAVADOC -overview overview.html -public -sourcepath $DIST/src -d $DIST/javadoc -use -author -version -header "Ganymed SSH-2 for Java" -doctitle "Ganymed SSH-2 for Java" ch.ethz.ssh2

$JAR -cf $DIST/$DIST.jar -C bin ch/
$JAR -uf $DIST/$DIST.jar LICENSE.txt

rm -f $DIST.zip
zip -r $DIST.zip $DIST
md5sum $DIST.zip
