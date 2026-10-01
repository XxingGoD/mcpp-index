package = {
    spec        = "1",
    namespace   = "compat",
    name        = "muduo",
    description = "A C++ network library for Linux and macOS",
    licenses    = {"BSD-3-Clause"},
    repo        = "https://github.com/chenshuo/muduo",
    type        = "package",

    xpm = {
        linux = {
            ["2.0.3"] = {
                url    = "https://github.com/chenshuo/muduo/archive/refs/tags/v2.0.3.tar.gz",
                sha256 = "5e90c2f07074ed5ab9347959edc8d387e40a57fbffb92e4a99cfb9a230851371",
            },
        },
        macosx = {
            ["2.0.3"] = {
                url    = "https://github.com/chenshuo/muduo/archive/refs/tags/v2.0.3.tar.gz",
                sha256 = "5e90c2f07074ed5ab9347959edc8d387e40a57fbffb92e4a99cfb9a230851371",
            },
        },
        windows = {
            ["2.0.3"] = {
                url    = "https://github.com/chenshuo/muduo/archive/refs/tags/v2.0.3.tar.gz",
                sha256 = "5e90c2f07074ed5ab9347959edc8d387e40a57fbffb92e4a99cfb9a230851371",
            },
        },
    },

    mcpp = {
        language     = "c++23",
        import_std   = false,
        include_dirs = { "*" },
        sources      = {
            "*/muduo/base/*.cc",
            "*/muduo/net/poller/DefaultPoller.cc",
            "*/muduo/net/poller/EPollPoller.cc",
            "*/muduo/net/poller/PollPoller.cc",
            "*/muduo/net/Acceptor.cc",
            "*/muduo/net/Buffer.cc",
            "*/muduo/net/Channel.cc",
            "*/muduo/net/Connector.cc",
            "*/muduo/net/EventLoop.cc",
            "*/muduo/net/EventLoopThread.cc",
            "*/muduo/net/EventLoopThreadPool.cc",
            "*/muduo/net/InetAddress.cc",
            "*/muduo/net/Poller.cc",
            "*/muduo/net/Socket.cc",
            "*/muduo/net/SocketsOps.cc",
            "*/muduo/net/TcpClient.cc",
            "*/muduo/net/TcpConnection.cc",
            "*/muduo/net/TcpServer.cc",
            "*/muduo/net/Timer.cc",
            "*/muduo/net/TimerQueue.cc",
        },
        targets = {
            ["muduo"] = { kind = "lib" },
        },
        deps = {
            ["compat.boost-circular-buffer"] = "1.92.0",
            ["compat.boost-any"] = "1.92.0",
            ["compat.boost-utility"] = "1.92.0",
        },
    },
}
