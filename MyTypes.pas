unit MyTypes;

interface

TYPE
  T2DIM_Array   = array[0..7, 0..3] of Integer;
  T7x2DIM_Array = array[0..7, 0..1] of Integer;
  T7x4DIM_Array = array[0..7, 0..4] of Integer;

  TSettings_Array = array of Integer; //or array[0..N] of string if it's fixed size
  TSettings_Array_List = array of TSettings_Array;//or array[0..N] of TMyArray

  implementation

end.


