/*
==============================================================================

Mathematical functions

Numeric operations on floating point number values.

Credits to Joshua Skelton joshua.skelton@gmail.com

==============================================================================
*/

/*
---------------------------------------------------------
Clamp value

Returns input value if between the lower and upper limits
Returns lower limit limit if input value is less
Returns the upper limit if input value is greater

value:    Input number
minValue: Lower limit
maxValue: Upper limit

Credits to Joshua Skelton
---------------------------------------------------------
*/

float(float value, float minValue, float maxValue) clamp =
{
  if (value < minValue)
    return minValue;
  else if (value > maxValue)
    return maxValue;

  return value;
};

/*
-------------------------------------------
Modulo

Returns the remainder of 'a' divided by 'n'

a: Dividend
n: Divisor

Credits to Joshua Skelton
-------------------------------------------
*/
float(float a, float n) mod =
{
  return a - (n * floor(a / n));
}

/*
-----------------------------
Sign

Returns +1 if 'x' is positive
Returns -1 if 'x' is negative
Returns 0 if 'x' is 0

x: The number

Credits to Joshua Skelton
-----------------------------
*/
float(float x) sign =
{
  if (x > 0)
    return 1;
  else if (x < 0)
    return -1;

  return 0;
};

/*
------------------------------------------------------------
Wrap

Returns input value if between the lower and upper limits
Returns a value looped back around if exceeding either limit

value:    Input number
minValue: Lower limit
maxValue: Upper limit

Credits to Joshua Skelton
------------------------------------------------------------
*/
float(float value, float minValue, float maxValue) wrap =
{
    local float range = maxValue - minValue;

    return mod(value - minValue, range + 1) + minValue;
};
