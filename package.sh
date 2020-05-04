export PKG_DIR="python"
export ZIP_DIR="code_package.zip"

sudo rm -rf ${ZIP_DIR}

sudo rm -rf ${PKG_DIR} && mkdir -p ${PKG_DIR}

sudo docker run --rm -v $(pwd):/foo -w /foo lambci/lambda:build-python3.6 \
    pip install -r requirements.txt -t ${PKG_DIR}

zip -r9  ${ZIP_DIR} ${PKG_DIR}/

sudo rm -rf ${PKG_DIR}
