# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule OSQP_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("OSQP")
JLLWrappers.@generate_main_file("OSQP", UUID("9c4f68bf-6205-5545-a508-2878b064d984"))
end  # module OSQP_jll
