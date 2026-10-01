#include <boost/circular_buffer.hpp>

int main() {
    boost::circular_buffer<int> values(3);
    values.push_back(1);
    values.push_back(2);
    values.push_back(3);
    values.push_back(4);
    return values.size() == 3 && values.front() == 2 && values.back() == 4
        ? 0 : 1;
}
