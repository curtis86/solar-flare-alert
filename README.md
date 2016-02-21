# solar-flare-alert

## A. Summary

A script to generate alerts on solar flare events, using NOAA SWPC JSON data on the latest x-ray events from our sun.

## B. Dependencies

 * bc
 * wget
 * jq
 * mail
 * md5 or md5sum

The above are easily installed on most Linux distributions (eg: `yum install bc`, `apt-get install bc`, etc)

## C. Supported Systems

Any system with BASH 3.2+ (not test on older versions).

### Installation

1. Clone this repo to your preferred directory (eg: /opt/solar-flare-alert)

  ```
  cd /opt
  git clone https://github.com/curtis86/solar-flare-alert
  ```


### Usage

  * Set your preferred solar flare alert class (eg: B2.5, C7.5, M1, X1, etc; see: https://en.wikipedia.org/wiki/Solar_flare#Classification) in `includes/solar-flare-alert-vars.sh`
  * Set your notification email address in `includes/solar-flare-alert-vars.sh`
  * Specify your md5 binary name (OSX: `md5`, Linux (coreutils): `md5sum`) in `includes/solar-flare-alert-vars.sh`
  * Optionally: add your own notification function! Eg: pushbullet, etc.

  Once the above is ready, run the script (after testing, we recommend running it every X minutes in cron):

```
./solar-flare-alert
```

## Notes

Please see Usage notes above -- it is important to set a few variables before using this script.

## Disclaimer

I'm not a programmer, but I do like to make things! Please use this at your own risk.

## Thanks

Thanks NOAA/NWS SWPC for making this data so easily available!

## License

The MIT License (MIT)

Copyright (c) 2016 Curtis K

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
