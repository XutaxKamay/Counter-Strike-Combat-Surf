#!/bin/sh
for s in ./*
do
	cp $s $(echo $s | tr '[:upper:]' '[:lower:]')
done
