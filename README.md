## Jupyter для интеграционных дел

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

### Для запуска в linux

```bash
sudo docker run -p 8888:8888 -it --rm -v /home/username:/input yakmed/jupyter-base bash
```

### Для запуска в macOS, необхожимо сначала установить docker desktop, затем в терминале

```bash
docker run -p 8888:8888 -it --rm -v /Users/username:/input yakmed/jupyter-base bash
```

### Внутри контейнера

```bash
jupyter notebook password
jupyter notebook --ip=0.0.0.0 --allow-root --no-browser
```

### Запустится jupter notebook на порту 8888, можно зайти по http://localhost:8888