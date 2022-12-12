
# Extract _irx_id symbol
raw_tmp=$(mipsel-ps2-elf-readelf -Ws $1 | grep _irx_id)
_irx_id_raw=( $raw_tmp )
# echo $raw_tmp

# It should returns something as
#           20:             001000cc     8      OBJECT  GLOBAL DEFAULT      5           _irx_id
# Where:                    offset      size                                section

offset=${_irx_id_raw[1]}
size=${_irx_id_raw[2]}
section=${_irx_id_raw[6]}

# Size MUST BE 8 otherwise it won't work
if [[ $size -ne 8 ]]; then
    echo "Size of symbol _irx_id is not 8, it is $size, aborting!"
    exit 1
fi

# Extract section content
raw_tmp=$(mipsel-ps2-elf-readelf -x$section $1 | grep $offset)
_irx_id_hex=( $raw_tmp )
# echo $raw_tmp

irx_name_ptr=${_irx_id_hex[1]}
irx_version=${_irx_id_hex[2]}

# echo $offset
# echo $size
# echo $section
# echo $_irx_id_hex
echo $irx_name_ptr
echo $irx_version