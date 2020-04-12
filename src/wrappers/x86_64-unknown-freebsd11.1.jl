# Autogenerated wrapper script for OSQP_jll for x86_64-unknown-freebsd11.1
export qdldl, osqp

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `qdldl`
const qdldl_splitpath = ["lib", "libqdldl.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
qdldl_path = ""

# qdldl-specific global declaration
# This will be filled out by __init__()
qdldl_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const qdldl = "libqdldl.so"


# Relative path to `osqp`
const osqp_splitpath = ["lib", "libosqp.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
osqp_path = ""

# osqp-specific global declaration
# This will be filled out by __init__()
osqp_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const osqp = "libosqp.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"OSQP")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global qdldl_path = normpath(joinpath(artifact_dir, qdldl_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global qdldl_handle = dlopen(qdldl_path)
    push!(LIBPATH_list, dirname(qdldl_path))

    global osqp_path = normpath(joinpath(artifact_dir, osqp_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global osqp_handle = dlopen(osqp_path)
    push!(LIBPATH_list, dirname(osqp_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

