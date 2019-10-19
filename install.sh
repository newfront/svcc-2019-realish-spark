#!/bin/bash

ROOT_DIR=`pwd`

function before {
    cd data && unzip winereviews.json.zip
}

before
