# Autogenerated wrapper script for OSQP_jll for aarch64-apple-darwin
export osqp, qdldl

JLLWrappers.@generate_wrapper_header("OSQP")
JLLWrappers.@declare_library_product(osqp, "@rpath/libosqp.dylib")
JLLWrappers.@declare_library_product(qdldl, "@rpath/libqdldl.dylib")
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        osqp,
        "lib/libosqp.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        qdldl,
        "lib/libqdldl.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
