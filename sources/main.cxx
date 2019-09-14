#include <cmath>  // std::sin
#include <cstdlib>  // EXIT_SUCCESS
#include <cstddef>  // std::size_t, NULL

#include <array>  // std::array
#include <iostream>  // std::{cerr, clog}
#include <ostream>  // std::ostream

#include <pthread.h>  // pthread_*


namespace Constants
{
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wfloat-conversion"
  /**
   * @brief π.
   * @tparam TArithmetic
   */
  template <typename TArithmetic>
  inline constexpr TArithmetic Pi { 3.141592653589793238462643383279502884l };
#pragma GCC diagnostic pop
}


namespace Algorithms
{
  /**
   * @brief
   * @tparam TX
   * @tparam TY
   * @param x
   * @param x_0
   * @param x_1
   * @param y_0
   * @param y_1
   * @return
   */
  template <typename TX, typename TY = TX>
  [[nodiscard]] constexpr TY
  lerp (TX x, TX x_0, TX x_1, TY y_0, TY y_1)
  {
    static_assert (std::is_arithmetic_v <TX>);
    static_assert (std::is_arithmetic_v <TY>);

    return y_0 + (x - x_0) * (y_1 - y_0) / (x_1 - x_0);
  }
}


namespace Types
{
  using real_type = double;

  using math_function_type = real_type (real_type);


  struct Parameters
  {
    real_type end;

    std::size_t iterations;

    real_type start;

    std::size_t threads;
  };


  struct ThreadContext
  {
    real_type end;

    std::size_t id;

    std::size_t iterations;

    real_type result;

    real_type start;


    friend std::ostream &
    operator << (std::ostream & output, const ThreadContext & self)
    {
      output
        << "ThreadContext{end:" << self.end
        << ";id:" << self.id
        << ";iterations:" << self.iterations
        << ";result:" << self.result
        << ";start:" << self.start << '}';

      return output;
    }
  };
}


namespace Config
{
  using namespace Types;


  inline constexpr math_function_type * Function (std::sin);
}


namespace Implementation
{
  using namespace Config;

  using namespace Types;


  void *
  Integrate (void * args)
  {
    ThreadContext * const context ((ThreadContext *) args);

    double result (0.0);
    const real_type x ((context->end - context->start) / real_type (context->iterations));
    for (size_t i (0); i < context->iterations; ++ i) {
      const real_type y (
        Algorithms::lerp (
          real_type (i + 1), real_type (0), real_type (context->iterations), context->start, context->end
        )
      );
      result += x * Function (y);
    }

    context->result = result;

    return NULL;
  }
}


int
main (int argc [[maybe_unused]], char * argv [] [[maybe_unused]])
{
  using namespace Implementation;

  using namespace Types;


  constexpr Parameters parameters {
    .end = real_type (2) * Constants::Pi <real_type>,
    .iterations = 10'000,
    .start = real_type (0),
    .threads = 4,
  };

  std::array <ThreadContext, parameters.threads> contexts;
  for (std::size_t i (0); i < parameters.threads; ++ i)
  {
    contexts [i].end = Algorithms::lerp (
      real_type (i + 1), real_type (0), real_type (parameters.threads), parameters.start, parameters.end
    );
//    contexts [i].end = parameters.start + real_type (i + 1) * (parameters.end - parameters.start) / parameters.threads;
    contexts [i].id = i;
    contexts [i].iterations = parameters.iterations / parameters.threads;
    contexts [i].start = Algorithms::lerp (
      real_type (i), real_type (0), real_type (parameters.threads), parameters.start, parameters.end
    );
//    contexts [i].start = parameters.start + real_type (i) * (parameters.end - parameters.start) / parameters.threads;
  }

  std::array <pthread_t, parameters.threads> thread_handles;
  for (std::size_t i (0); i < parameters.threads; ++ i)
  {
    const int created (pthread_create (& thread_handles [i], NULL, Integrate, & contexts [i]));
    if (created != 0)
    {
      std::cerr << "Couldn't create thread " << i << std::endl;

      return EXIT_FAILURE;
    }

    std::clog << "Thread " << i << " created" << std::endl;
  }

  for (std::size_t i (0); i < parameters.threads; ++ i)
  {
    const int joined (pthread_join (thread_handles [i], NULL));
    if (joined != 0)
    {
      std::cerr << "Couldn't join thread " << i << std::endl;

      return EXIT_FAILURE;
    }

    std::clog << "Thread " << i << " joined" << std::endl;
  }

  real_type result (0.0);
  for (std::size_t i (0); i < parameters.threads; ++ i)
  {
    std::clog << "Context " << i << ": " << contexts [i] << std::endl;

    result += contexts [i].result;
  }

  std::clog << "Result: " << result << std::endl;

  return EXIT_SUCCESS;
}
