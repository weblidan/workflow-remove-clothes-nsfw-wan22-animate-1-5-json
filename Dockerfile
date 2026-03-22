# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui_essentials --mode remote

# Unknown registry custom nodes could not be resolved automatically (no aux_id provided). Please add them manually to /comfyui/custom_nodes/ or provide their GitHub repos.
# Could not resolve unknown registry custom node: CLIPVisionLoader
# Could not resolve unknown registry custom node: CLIPVisionEncode
# Could not resolve unknown registry custom node: LoraLoaderModelOnly
# Could not resolve unknown registry custom node: ModelSamplingSD3
# Could not resolve unknown registry custom node: LoraLoaderModelOnly
# Could not resolve unknown registry custom node: DWPreprocessor
# Could not resolve unknown registry custom node: DWPreprocessor
# Could not resolve unknown registry custom node: PixelPerfectResolution
# Could not resolve unknown registry custom node: PrimitiveInt
# Could not resolve unknown registry custom node: PrimitiveInt
# Could not resolve unknown registry custom node: VHS_LoadVideo
# Could not resolve unknown registry custom node: VHS_VideoInfo
# Could not resolve unknown registry custom node: DrawMaskOnImage
# Could not resolve unknown registry custom node: BlockifyMask
# Could not resolve unknown registry custom node: GrowMask
# Could not resolve unknown registry custom node: ClothesSegment
# Could not resolve unknown registry custom node: TrimVideoLatent
# Could not resolve unknown registry custom node: TrimVideoLatent
# Could not resolve unknown registry custom node: TrimVideoLatent
# Could not resolve unknown registry custom node: VHS_VideoCombine
# Could not resolve unknown registry custom node: ImageBatchMulti
# Could not resolve unknown registry custom node: WanAnimateToVideo
# Could not resolve unknown registry custom node: GetImageRangeFromBatch
# Could not resolve unknown registry custom node: GetImageRangeFromBatch
# Could not resolve unknown registry custom node: GetImageRangeFromBatch
# Could not resolve unknown registry custom node: VHS_GetImageCount
# Could not resolve unknown registry custom node: VHS_GetImageCount
# Could not resolve unknown registry custom node: VHS_GetImageCount
# Could not resolve unknown registry custom node: easy seed
# Could not resolve unknown registry custom node: WanAnimateToVideo
# Could not resolve unknown registry custom node: WanAnimateToVideo
# Could not resolve unknown registry custom node: VHS_VideoInfoLoaded
# Could not resolve unknown registry custom node: ExecutePythonaa42551d0f5fd1bf6d9943138f108182dac168dfdc86aaffc57382534172a1c1
# Could not resolve unknown registry custom node: PreviewAny
# Could not resolve unknown registry custom node: TextEncodeQwenImageEditPlus
# Could not resolve unknown registry custom node: CheckpointLoaderSimple
# Could not resolve unknown registry custom node: TextEncodeQwenImageEditPlus
# Could not resolve unknown registry custom node: ImageFromBatch

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors --relative-path models/vae --filename wan_2.1_vae.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors --relative-path models/clip --filename clip_vision_h.safetensors
RUN comfy model download --url https://huggingface.co/Kijai/WanVideo_comfy/blob/main/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors --relative-path models/diffusion_models --filename lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors --relative-path models/clip --filename umt5_xxl_fp8_e4m3fn_scaled.safetensors
# RUN # Could not find URL for Wan2_2-Animate-14B_fp8_e4m3fn_scaled_KJ.safetensors
# RUN # Could not find URL for WanAnimate_relight_lora_fp16.safetensors
# RUN # Could not find URL for yolox_l.torchscript.pt
# RUN # Could not find URL for dw-ll_ucoco_384_bs5.torchscript.pt
# RUN # Could not find URL for Qwen-Rapid-AIO-NSFW-v19.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
