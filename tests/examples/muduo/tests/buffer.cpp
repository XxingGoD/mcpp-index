#ifdef __linux__
#include <muduo/net/Buffer.h>

#include <cstring>

int main() {
    muduo::net::Buffer buffer;
    const char payload[] = "muduo";
    buffer.append(payload, sizeof(payload) - 1);
    if (buffer.readableBytes() != sizeof(payload) - 1) return 1;
    if (std::memcmp(buffer.peek(), payload, sizeof(payload) - 1) != 0) return 1;
    buffer.retrieveAll();
    return buffer.readableBytes() == 0 ? 0 : 1;
}
#else
int main() { return 0; }
#endif
