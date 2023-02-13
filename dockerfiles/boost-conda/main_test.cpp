// main_test.cpp
// Simple boost test example


#define BOOST_TEST_MODULE FirstTestModule
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_CASE(FirstTestCase)
{
  BOOST_CHECK(5 == 5);
  BOOST_CHECK_EQUAL(9, 9);
  BOOST_CHECK_LT(8, 9);
  BOOST_CHECK_GT(10, 9);
}

