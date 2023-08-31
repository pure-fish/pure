# Spectra

> Refer to [Spectra order of insect][spectra], known for mimicking vegetation.

## Mocking

* `_mock`: Mock a function using the mock in `tests/mocks/`
  * `function_name`: name of the method to mock
* `_mock_exit_status`: Mock a response exit status for a mock function
  * `function_name`: name of the method to mock
  * `status_code`: response to return
* `_mock_response`: Mock a response for a mock function
  * `function_name`: name of the method to mock
  * `response`: response to return
* `_clean_mock`: Clean a mock function  (warning: erase the function)
  * `function_name`: name of the method to mock

## Spying

* `_spy`: Create a spy method so, you can check it's been called with `_has_called`
  * `function_name`: name of the method to spy
* `_has_called`: check spy method has been called, i.e has written to the /tmp/$function_name.mock_calls
  * `function_name`: name of the that have been spied on
  * `function_args` # arguments to passed to the spy

## Cleaning

* `_clean_all_mocks`: Clean all mock functions created by `_mock`
* `_pure_unmock`: Restore a pure function by reloading its source
  * `function_name`: name of the method to mock
* `_clean_all_spy_calls`: Clean all spy calls created by `_spy`

[spectra]: https://en.wikipedia.org/wiki/Phasmatodea
