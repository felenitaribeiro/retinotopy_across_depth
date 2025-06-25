#!/usr/bin/env bash

Subj='114823'
h='L'
mkdir -p ./data/$Subj

for mapping in 'RETBAR1_7T_AP' 'RETBAR2_7T_PA' 'RETCCW_7T_AP' 'RETCW_7T_PA' 'RETEXP_7T_AP' 'RETCON_7T_PA'; do

    aws s3 cp s3://hcp-openaccess/HCP_1200/"$Subj"/MNINonLinear/Results/tfMRI_"$mapping"/tfMRI_"$mapping".L.native.func.gii ./data/$Subj/tfMRI_"$mapping".L.native.func.gii
    aws s3 cp s3://hcp-openaccess/HCP_1200/"$Subj"/MNINonLinear/Results/tfMRI_"$mapping"/tfMRI_"$mapping".nii.gz ./data/$Subj/tfMRI_"$mapping".nii.gz

    # aws s3 cp s3://hcp-openaccess/HCP_1200/"$Subj"/MNINonLinear/Native/"$Subj".L.pial.native.surf.gii ./data/$Subj
    # aws s3 cp s3://hcp-openaccess/HCP_1200/"$Subj"/MNINonLinear/Native/"$Subj".L.white.native.surf.gii ./data/$Subj
    # aws s3 cp s3://hcp-openaccess/HCP_1200/"$Subj"/MNINonLinear/Native/"$Subj".L.midthickness.native.surf.gii ./data/$Subj
    # aws s3 cp s3://hcp-openaccess/HCP_1200/"$Subj"/MNINonLinear/Native/"$Subj".L.sphere.native.surf.gii ./data/$Subj

    # for layer in 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9; do
    #     wb_command -surface-cortex-layer ./data/$Subj/"$Subj".L.white.native.surf.gii \
    #     ./data/$Subj/"$Subj".L.pial.native.surf.gii \
    #     $layer \
    #     ./data/$Subj/"$Subj".L.layer."$layer".native.surf.gii
        
    #     if [[ $layer == 0.1 ]]; then
    #         wb_command -volume-to-surface-mapping ./data/$Subj/tfMRI_"$mapping".nii.gz \
    #             ./data/$Subj/"$Subj".L.midthickness.native.surf.gii \
    #             ./data/$Subj/tfMRI_"$mapping".layer."$layer".L.native.func.gii -ribbon-constrained \
    #             ./data/$Subj/"$Subj".L.white.native.surf.gii \
    #             ./data/$Subj/"$Subj".L.layer."$layer".native.surf.gii -trilinear
    #     elif [[ $layer == 0.9 ]]; then
    #         wb_command -volume-to-surface-mapping ./data/$Subj/tfMRI_"$mapping".nii.gz \
    #             ./data/$Subj/"$Subj".L.midthickness.native.surf.gii \
    #             ./data/$Subj/tfMRI_"$mapping".layer."$layer".L.native.func.gii -ribbon-constrained \
    #             ./data/$Subj/"$Subj".L.layer."$layer".native.surf.gii \
    #             ./data/$Subj/"$Subj".L.pial.native.surf.gii -trilinear
    #     else
    #         lower=$(echo "$layer - 0.1" | bc)  # Use bc for floating-point arithmetic
    #         wb_command -volume-to-surface-mapping ./data/$Subj/tfMRI_"$mapping".nii.gz \
    #             ./data/$Subj/"$Subj".L.midthickness.native.surf.gii \
    #             ./data/$Subj/tfMRI_"$mapping".layer."$layer".L.native.func.gii -ribbon-constrained \
    #             ./data/$Subj/"$Subj".L.layer.0"$lower".native.surf.gii \
    #             ./data/$Subj/"$Subj".L.layer."$layer".native.surf.gii -trilinear
    #     fi

    done
done