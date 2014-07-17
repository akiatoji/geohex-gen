geohex-gen
==========

Geohex command line utility

=======
# Geohex::Gen

## Installation

    $ gem install geohex-gen

## Usage

This gem installs a command line tool named ghgen that:
 
* Given lat, lon return geohex level 10 code.
* Given a GH (any size), display center lat/lon and show GH4/5/6 that contains this location
* Given a GH (any size) and a ring size, display geohex codes that form the ring(s). 

    Usage: ghgen [options]
        -a LAT                           Latitude. If used, must have longitude also
        -o LON                           Longitude. If used, must have latitude also
        -g GH                            Specify center geohex directly
        -r [RING]                        Number of rings around center


### Return geohex 4-6 that includes a geohex

    $shell> ghgen -g PC22713455
    
    Center GH is PC22713455, located at 32.91066810490208, -117.21383935375704
    
    This location is included in
    
    GH4: PC2271
    GH5: PC22713
    GH6: PC227134
    
Note that you can't always truncate a GH string to get to larger size.  
Geohexes that are on apex ending with 2 or 6 ends up on parent with different code system. ghgen handles this properly.

    $shell> ghgen -g PC2266666

    Center GH is PC2266666, located at 32.70505659484853, -115.56470050297207
    
    This location is included in
    
    GH4: PC2500
    GH5: PC25000
    GH6: PC218888


### Get geohex from lat lon

    $shell> ghgen -a 32.90475787738992 -o -117.20164609053498

    Center GH is PC2271344444, located at 32.90475787738992, -117.20164609053498
    
    This location is included in
    
    GH4: PC2271
    GH5: PC22713
    GH6: PC227134


### Get a list of Geohexes that form one or more ring around the center GH

    $shell> ghgen -g PC22751 -r 1
    
    Center GH is PC22751, located at 33.14380613603259, -117.3662551440329
    
    This location is included in
    
    GH4: PC2275
    GH5: PC22751
    GH6: PC227514
    
    Center PC22751, Ring(s) 1:
    PC22727
    PC22754
    PC22752
    PC22726
    PC22755
    PC22750

You can specify ring size with lat/lon, but the ring is always in GH10.


## Contributing

1. Fork it ( https://github.com/[my-github-username]/geohex-gen/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
