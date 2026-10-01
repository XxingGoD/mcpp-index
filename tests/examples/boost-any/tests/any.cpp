#include <boost/any.hpp>

#include <string>

int main() {
    boost::any value = 42;
    if (value.empty()) return 1;
    if (boost::any_cast<int>(value) != 42) return 1;

    value = std::string("muduo");
    const auto* text = boost::any_cast<std::string>(&value);
    if (text == nullptr || *text != "muduo") return 1;

    value.clear();
    return value.empty() ? 0 : 1;
}
