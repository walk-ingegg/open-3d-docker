# OPEN3D_ENV

## これは何？
- open3dの開発環境をdockerで構築してみる


## 参考

### open3d
- [公式ドキュメント](http://www.open3d.org/docs/release/index.html)

### docker
- [【図解】Dockerの全体像を理解する -前編-](https://qiita.com/etaroid/items/b1024c7d200a75b992fc)
- [DockerとDocker ComposeでPythonの実行環境を作成する](https://zuma-lab.com/posts/docker-python-settings)
- [【Docker-Compose】コンテナ起動から入るまでを丁寧に](https://qiita.com/tsuboyataiki/items/90dbe94553d3dea39b19)


---

# GUIを表示するための、WSL2, Docker Desktop, Open3D セットアップ

## 1. WSL2 の有効化

1. PowerShell を**管理者権限**で開き、以下のコマンドを実行してWSLをインストールします。
    ```powershell
    wsl --install
    ```

2. インストールが完了したら、PC を再起動します。

## 2. Linux ディストリビューションのインストール

1. Microsoft Store を開き、お好きな Linux ディストリビューション（例: Ubuntu）をインストールします。
2. インストールが完了したら、ディストリビューションを起動して初期設定を行います。

## 3. WSL2 への切り替え

1. PowerShell を開き、以下のコマンドを実行して、インストールしたディストリビューションを WSL2 に切り替えます。
    ```powershell
    wsl --set-version Ubuntu 2
    ```

## 4. Docker Desktop のインストールと設定

1. [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop) から Docker Desktop をダウンロードしてインストールします。
2. Docker Desktop を開き、設定から WSL 2 ベースのエンジンを有効にします。
3. WSL Integration 設定で、インストールした Linux ディストリビューションを有効にします。

## 5. Docker コンテナの実行

1. WSL2 のターミナルを開き、プロジェクトディレクトリ（例: `/mnt/d/git/open_3d`）に移動します。

2. Docker コンテナをビルド・起動します。
    ```bash
    docker-compose up -d --build
    ```

3. サンプルコードをコンテナ内で実行します。
    ```bash
    docker exec -it python3 python3 test.py
    ```

