// Copyright (c) 2001, Nokia. All rights reserved.

#ifndef __MAUDIOADAPTER__
#define __MAUDIOADAPTER__

#include <e32std.h>

/*! 
  @class MAudioAdapter
  
  @discussion An instance of class MAudioAdapter is an adapter for an audio utility object
  */
class MAudioAdapter
    {
public:

/*! 
  @function PlayL
  
  @discussion Play the audio utility.
  */
    virtual void PlayL() = 0;

/*! 
  @function StopL
  
  @discussion Stop the audio utility.
  */
    virtual void StopL() = 0;

/*! 
  @function RecordL
  
  @discussion Record using the audio utility (if supported).
  */
    virtual void RecordL() = 0;

    };

#endif // __MAUDIOADAPTER__
