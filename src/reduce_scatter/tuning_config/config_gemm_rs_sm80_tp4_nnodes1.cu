//===- config_gemm_rs_sm80_tp4_nnodes1.cu ------------------------- C++ ---===//
//
// Copyright 2023 ByteDance Ltd. and/or its affiliates. All rights reserved.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//===----------------------------------------------------------------------===//

// clang-format off
#include "flux/op_registry.h"
namespace bytedance::flux {
using namespace cute;

static int config_gemm_rs_sm80_tp4_nnodes1 = []() {
  auto &inst = TuningConfigRegistry::instance();
  /// NVLink
  inst.add(make_gemm_meta(make_gemm_dtype_config(_BF16{}(),_BF16{}(),_Void{}(),_BF16{}()),_Sm80{}(),_ReduceScatter{}(),_RCR{}(),_GemmV2{}(),None{},make_reduce_scatter_meta(false,_IntraNode{}())),make_runtime_config(8192,12288,12288,make_reduce_scatter_runtime_config(4,1)),make_gemm_hparams(make_gemm_v2_hparams(cute::make_tuple(64l,64l,32l),cute::make_tuple(16l,8l,16l)),None{},cute::make_tuple(128l,256l,32l),_GemmStreamK{}(),3,_RasterHeuristic{}()));
  inst.add(make_gemm_meta(make_gemm_dtype_config(_BF16{}(),_BF16{}(),_Void{}(),_BF16{}()),_Sm80{}(),_ReduceScatter{}(),_RRR{}(),_GemmV2{}(),None{},make_reduce_scatter_meta(false,_IntraNode{}())),make_runtime_config(8192,12288,12288,make_reduce_scatter_runtime_config(4,1)),make_gemm_hparams(make_gemm_v2_hparams(cute::make_tuple(64l,64l,32l),cute::make_tuple(16l,8l,16l)),None{},cute::make_tuple(128l,256l,32l),_GemmStreamK{}(),3,_RasterHeuristic{}()));
  return 0;
}();
}
// clang-format on