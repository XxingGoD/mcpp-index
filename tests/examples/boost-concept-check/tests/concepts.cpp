#include <boost/concept_check.hpp>

BOOST_CONCEPT_ASSERT((boost::CopyConstructible<int>));
BOOST_CONCEPT_ASSERT((boost::DefaultConstructible<int>));

int main() {
    int value = 42;
    return value == 42 ? 0 : 1;
}
