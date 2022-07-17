# hot-corners

Custom hot corners for Linux.

## Build

```bash
/bin/bash setup.sh
```

or quickly download and setup as below.

## Install via [installer](https://github.com/bug3/installer)

-   [curl](https://curl.se):

    ```bash
    bash <(curl -sL dar.vin/install) bug3 hot-corners
    ```

-   [wget](https://www.gnu.org/software/wget):

    ```bash
    bash <(wget -qO- dar.vin/install) bug3 hot-corners
    ```

## Uninstall

Add the -r parameter to the end of the installation [code](https://github.com/bug3/installer/blob/master/USAGE.md)

## Usage

```bash
hot-corners [corner] [script]
```

-   e.g.

    ```bash
    hot-corners top-left "xmessage test"
    ```

## License

[MIT](https://choosealicense.com/licenses/mit/)
