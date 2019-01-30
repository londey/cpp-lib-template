#include "clt/PublicClass.hpp"

#include <catch2/catch.hpp>


namespace clt::unittests
{

TEST_CASE("PublicClass")
{
  REQUIRE_NOTHROW(PublicClass());
}

}
