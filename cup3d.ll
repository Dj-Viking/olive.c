; ModuleID = './demos/cup3d.c'
source_filename = "./demos/cup3d.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32"

%struct.Olivec_Canvas = type { i32*, i32, i32, i32 }
%struct.Vector3 = type { float, float, float }
%struct.Vector2 = type { float, float }

@angle = internal global float 0.000000e+00, align 4
@pixels = internal global [691200 x i32] zeroinitializer, align 16
@zbuffer = internal global [691200 x float] zeroinitializer, align 16
@faces = internal constant [224 x [3 x i32]] [[3 x i32] [i32 26, i32 17, i32 16], [3 x i32] [i32 9, i32 10, i32 0], [3 x i32] [i32 16, i32 7, i32 6], [3 x i32] [i32 13, i32 4, i32 3], [3 x i32] [i32 0, i32 11, i32 1], [3 x i32] [i32 7, i32 18, i32 8], [3 x i32] [i32 14, i32 5, i32 4], [3 x i32] [i32 1, i32 12, i32 2], [3 x i32] [i32 18, i32 9, i32 8], [3 x i32] [i32 15, i32 6, i32 5], [3 x i32] [i32 12, i32 3, i32 2], [3 x i32] [i32 23, i32 34, i32 24], [3 x i32] [i32 23, i32 14, i32 13], [3 x i32] [i32 20, i32 11, i32 10], [3 x i32] [i32 17, i32 28, i32 18], [3 x i32] [i32 24, i32 15, i32 14], [3 x i32] [i32 21, i32 12, i32 11], [3 x i32] [i32 28, i32 19, i32 18], [3 x i32] [i32 25, i32 16, i32 15], [3 x i32] [i32 22, i32 13, i32 12], [3 x i32] [i32 29, i32 10, i32 19], [3 x i32] [i32 33, i32 44, i32 34], [3 x i32] [i32 20, i32 31, i32 21], [3 x i32] [i32 27, i32 38, i32 28], [3 x i32] [i32 34, i32 25, i32 24], [3 x i32] [i32 21, i32 32, i32 22], [3 x i32] [i32 28, i32 39, i32 29], [3 x i32] [i32 35, i32 26, i32 25], [3 x i32] [i32 32, i32 23, i32 22], [3 x i32] [i32 39, i32 20, i32 29], [3 x i32] [i32 36, i32 27, i32 26], [3 x i32] [i32 45, i32 43, i32 41], [3 x i32] [i32 40, i32 31, i32 30], [3 x i32] [i32 47, i32 38, i32 37], [3 x i32] [i32 34, i32 45, i32 35], [3 x i32] [i32 41, i32 32, i32 31], [3 x i32] [i32 48, i32 39, i32 38], [3 x i32] [i32 45, i32 36, i32 35], [3 x i32] [i32 42, i32 33, i32 32], [3 x i32] [i32 49, i32 30, i32 39], [3 x i32] [i32 46, i32 37, i32 36], [3 x i32] [i32 100, i32 94, i32 96], [3 x i32] [i32 90, i32 95, i32 91], [3 x i32] [i32 96, i32 90, i32 92], [3 x i32] [i32 97, i32 92, i32 93], [3 x i32] [i32 91, i32 97, i32 93], [3 x i32] [i32 103, i32 101, i32 99], [3 x i32] [i32 101, i32 96, i32 97], [3 x i32] [i32 95, i32 101, i32 97], [3 x i32] [i32 94, i32 99, i32 95], [3 x i32] [i32 103, i32 109, i32 105], [3 x i32] [i32 102, i32 99, i32 98], [3 x i32] [i32 100, i32 102, i32 98], [3 x i32] [i32 101, i32 104, i32 100], [3 x i32] [i32 110, i32 107, i32 106], [3 x i32] [i32 106, i32 103, i32 102], [3 x i32] [i32 108, i32 102, i32 104], [3 x i32] [i32 105, i32 108, i32 104], [3 x i32] [i32 114, i32 110, i32 112], [3 x i32] [i32 112, i32 106, i32 108], [3 x i32] [i32 109, i32 112, i32 108], [3 x i32] [i32 107, i32 113, i32 109], [3 x i32] [i32 116, i32 111, i32 110], [3 x i32] [i32 115, i32 111, i32 117], [3 x i32] [i32 114, i32 113, i32 115], [3 x i32] [i32 26, i32 27, i32 17], [3 x i32] [i32 9, i32 19, i32 10], [3 x i32] [i32 16, i32 17, i32 7], [3 x i32] [i32 13, i32 14, i32 4], [3 x i32] [i32 0, i32 10, i32 11], [3 x i32] [i32 7, i32 17, i32 18], [3 x i32] [i32 14, i32 15, i32 5], [3 x i32] [i32 1, i32 11, i32 12], [3 x i32] [i32 18, i32 19, i32 9], [3 x i32] [i32 15, i32 16, i32 6], [3 x i32] [i32 12, i32 13, i32 3], [3 x i32] [i32 23, i32 33, i32 34], [3 x i32] [i32 23, i32 24, i32 14], [3 x i32] [i32 20, i32 21, i32 11], [3 x i32] [i32 17, i32 27, i32 28], [3 x i32] [i32 24, i32 25, i32 15], [3 x i32] [i32 21, i32 22, i32 12], [3 x i32] [i32 28, i32 29, i32 19], [3 x i32] [i32 25, i32 26, i32 16], [3 x i32] [i32 22, i32 23, i32 13], [3 x i32] [i32 29, i32 20, i32 10], [3 x i32] [i32 33, i32 43, i32 44], [3 x i32] [i32 20, i32 30, i32 31], [3 x i32] [i32 27, i32 37, i32 38], [3 x i32] [i32 34, i32 35, i32 25], [3 x i32] [i32 21, i32 31, i32 32], [3 x i32] [i32 28, i32 38, i32 39], [3 x i32] [i32 35, i32 36, i32 26], [3 x i32] [i32 32, i32 33, i32 23], [3 x i32] [i32 39, i32 30, i32 20], [3 x i32] [i32 36, i32 37, i32 27], [3 x i32] [i32 41, i32 40, i32 49], [3 x i32] [i32 49, i32 48, i32 41], [3 x i32] [i32 48, i32 47, i32 41], [3 x i32] [i32 47, i32 46, i32 45], [3 x i32] [i32 45, i32 44, i32 43], [3 x i32] [i32 43, i32 42, i32 41], [3 x i32] [i32 47, i32 45, i32 41], [3 x i32] [i32 40, i32 41, i32 31], [3 x i32] [i32 47, i32 48, i32 38], [3 x i32] [i32 34, i32 44, i32 45], [3 x i32] [i32 41, i32 42, i32 32], [3 x i32] [i32 48, i32 49, i32 39], [3 x i32] [i32 45, i32 46, i32 36], [3 x i32] [i32 42, i32 43, i32 33], [3 x i32] [i32 49, i32 40, i32 30], [3 x i32] [i32 46, i32 47, i32 37], [3 x i32] [i32 100, i32 98, i32 94], [3 x i32] [i32 90, i32 94, i32 95], [3 x i32] [i32 96, i32 94, i32 90], [3 x i32] [i32 97, i32 96, i32 92], [3 x i32] [i32 91, i32 95, i32 97], [3 x i32] [i32 103, i32 105, i32 101], [3 x i32] [i32 101, i32 100, i32 96], [3 x i32] [i32 95, i32 99, i32 101], [3 x i32] [i32 94, i32 98, i32 99], [3 x i32] [i32 103, i32 107, i32 109], [3 x i32] [i32 102, i32 103, i32 99], [3 x i32] [i32 100, i32 104, i32 102], [3 x i32] [i32 101, i32 105, i32 104], [3 x i32] [i32 110, i32 111, i32 107], [3 x i32] [i32 106, i32 107, i32 103], [3 x i32] [i32 108, i32 106, i32 102], [3 x i32] [i32 105, i32 109, i32 108], [3 x i32] [i32 114, i32 116, i32 110], [3 x i32] [i32 112, i32 110, i32 106], [3 x i32] [i32 109, i32 113, i32 112], [3 x i32] [i32 107, i32 111, i32 113], [3 x i32] [i32 116, i32 117, i32 111], [3 x i32] [i32 115, i32 113, i32 111], [3 x i32] [i32 114, i32 112, i32 113], [3 x i32] [i32 68, i32 57, i32 58], [3 x i32] [i32 78, i32 67, i32 68], [3 x i32] [i32 65, i32 54, i32 55], [3 x i32] [i32 62, i32 51, i32 52], [3 x i32] [i32 69, i32 58, i32 59], [3 x i32] [i32 56, i32 65, i32 55], [3 x i32] [i32 63, i32 52, i32 53], [3 x i32] [i32 60, i32 59, i32 50], [3 x i32] [i32 67, i32 56, i32 57], [3 x i32] [i32 64, i32 53, i32 54], [3 x i32] [i32 51, i32 60, i32 50], [3 x i32] [i32 75, i32 84, i32 74], [3 x i32] [i32 65, i32 74, i32 64], [3 x i32] [i32 72, i32 61, i32 62], [3 x i32] [i32 79, i32 68, i32 69], [3 x i32] [i32 66, i32 75, i32 65], [3 x i32] [i32 63, i32 72, i32 62], [3 x i32] [i32 60, i32 79, i32 69], [3 x i32] [i32 67, i32 76, i32 66], [3 x i32] [i32 74, i32 63, i32 64], [3 x i32] [i32 71, i32 60, i32 61], [3 x i32] [i32 83, i32 87, i32 89], [3 x i32] [i32 82, i32 71, i32 72], [3 x i32] [i32 89, i32 78, i32 79], [3 x i32] [i32 76, i32 85, i32 75], [3 x i32] [i32 73, i32 82, i32 72], [3 x i32] [i32 80, i32 79, i32 70], [3 x i32] [i32 77, i32 86, i32 76], [3 x i32] [i32 84, i32 73, i32 74], [3 x i32] [i32 81, i32 70, i32 71], [3 x i32] [i32 88, i32 77, i32 78], [3 x i32] [i32 68, i32 67, i32 57], [3 x i32] [i32 78, i32 77, i32 67], [3 x i32] [i32 65, i32 64, i32 54], [3 x i32] [i32 62, i32 61, i32 51], [3 x i32] [i32 69, i32 68, i32 58], [3 x i32] [i32 56, i32 66, i32 65], [3 x i32] [i32 63, i32 62, i32 52], [3 x i32] [i32 60, i32 69, i32 59], [3 x i32] [i32 67, i32 66, i32 56], [3 x i32] [i32 64, i32 63, i32 53], [3 x i32] [i32 51, i32 61, i32 60], [3 x i32] [i32 75, i32 85, i32 84], [3 x i32] [i32 65, i32 75, i32 74], [3 x i32] [i32 72, i32 71, i32 61], [3 x i32] [i32 79, i32 78, i32 68], [3 x i32] [i32 66, i32 76, i32 75], [3 x i32] [i32 63, i32 73, i32 72], [3 x i32] [i32 60, i32 70, i32 79], [3 x i32] [i32 67, i32 77, i32 76], [3 x i32] [i32 74, i32 73, i32 63], [3 x i32] [i32 71, i32 70, i32 60], [3 x i32] [i32 89, i32 80, i32 81], [3 x i32] [i32 81, i32 82, i32 83], [3 x i32] [i32 83, i32 84, i32 85], [3 x i32] [i32 85, i32 86, i32 87], [3 x i32] [i32 87, i32 88, i32 89], [3 x i32] [i32 89, i32 81, i32 83], [3 x i32] [i32 83, i32 85, i32 87], [3 x i32] [i32 82, i32 81, i32 71], [3 x i32] [i32 89, i32 88, i32 78], [3 x i32] [i32 76, i32 86, i32 85], [3 x i32] [i32 73, i32 83, i32 82], [3 x i32] [i32 80, i32 89, i32 79], [3 x i32] [i32 77, i32 87, i32 86], [3 x i32] [i32 84, i32 83, i32 73], [3 x i32] [i32 81, i32 80, i32 70], [3 x i32] [i32 88, i32 87, i32 77], [3 x i32] [i32 3, i32 52, i32 2], [3 x i32] [i32 0, i32 59, i32 9], [3 x i32] [i32 57, i32 6, i32 7], [3 x i32] [i32 4, i32 53, i32 3], [3 x i32] [i32 51, i32 0, i32 1], [3 x i32] [i32 58, i32 7, i32 8], [3 x i32] [i32 55, i32 4, i32 5], [3 x i32] [i32 52, i32 1, i32 2], [3 x i32] [i32 9, i32 58, i32 8], [3 x i32] [i32 56, i32 5, i32 6], [3 x i32] [i32 3, i32 53, i32 52], [3 x i32] [i32 0, i32 50, i32 59], [3 x i32] [i32 57, i32 56, i32 6], [3 x i32] [i32 4, i32 54, i32 53], [3 x i32] [i32 51, i32 50, i32 0], [3 x i32] [i32 58, i32 57, i32 7], [3 x i32] [i32 55, i32 54, i32 4], [3 x i32] [i32 52, i32 51, i32 1], [3 x i32] [i32 9, i32 59, i32 58], [3 x i32] [i32 56, i32 55, i32 5]], align 16
@vertices = internal constant [118 x [3 x float]] [[3 x float] [float 0x3FA8989160000000, float 0x3FE20B9120000000, float 0xBFE996BFC0000000], [3 x float] [float 0xBFDB01CD60000000, float 0x3FE20B9120000000, float 0xBFE4B3AAC0000000], [3 x float] [float 0xBFE6CC9860000000, float 0x3FE20B9120000000, float 0xBFCFA12B60000000], [3 x float] [float 0xBFE6CC9860000000, float 0x3FE20B9120000000, float 0x3FCFA12B60000000], [3 x float] [float 0xBFDB01CD60000000, float 0x3FE20B9120000000, float 0x3FE4B3AAC0000000], [3 x float] [float 0x3FA8989160000000, float 0x3FE20B9120000000, float 0x3FE996BFC0000000], [3 x float] [float 0x3FE093F6C0000000, float 0x3FE20B9120000000, float 0x3FE4B3AAC0000000], [3 x float] [float 0x3FE9DFAA80000000, float 0x3FE20B9120000000, float 0x3FCFA12B60000000], [3 x float] [float 0x3FE9DFAA80000000, float 0x3FE20B9120000000, float 0xBFCFA12B60000000], [3 x float] [float 0x3FE093F6C0000000, float 0x3FE20B9120000000, float 0xBFE4B3AAC0000000], [3 x float] [float 0x3FA8989160000000, float 0x3FC4119040000000, float 0xBFE6EBDF40000000], [3 x float] [float 0xBFD7DF0900000000, float 0x3FC4119040000000, float 0xBFE28B3700000000], [3 x float] [float 0xBFE4432440000000, float 0x3FC4119040000000, float 0xBFCC551940000000], [3 x float] [float 0xBFE4432440000000, float 0x3FC4119040000000, float 0x3FCC551940000000], [3 x float] [float 0xBFD7DF0900000000, float 0x3FC4119040000000, float 0x3FE28B3700000000], [3 x float] [float 0x3FA8989160000000, float 0x3FC4119040000000, float 0x3FE6EBDF40000000], [3 x float] [float 0x3FDE052D60000000, float 0x3FC4119040000000, float 0x3FE28B3700000000], [3 x float] [float 0x3FE7563880000000, float 0x3FC4119040000000, float 0x3FCC551940000000], [3 x float] [float 0x3FE7563880000000, float 0x3FC4119040000000, float 0xBFCC551940000000], [3 x float] [float 0x3FDE052D60000000, float 0x3FC4119040000000, float 0xBFE28B3700000000], [3 x float] [float 0x3FA8989160000000, float 0xBFCB140140000000, float 0xBFE262DC60000000], [3 x float] [float 0xBFD28A2EC0000000, float 0xBFCB140140000000, float 0xBFDDBFDF80000000], [3 x float] [float 0xBFDFE5EAA0000000, float 0xBFCB140140000000, float 0xBFC6B9FDC0000000], [3 x float] [float 0xBFDFE5EAA0000000, float 0xBFCB140140000000, float 0x3FC6B9FDC0000000], [3 x float] [float 0xBFD28A2EC0000000, float 0xBFCB140140000000, float 0x3FDDBFDF80000000], [3 x float] [float 0x3FA8989160000000, float 0xBFCB140140000000, float 0x3FE262DC60000000], [3 x float] [float 0x3FD8B05320000000, float 0xBFCB140140000000, float 0x3FDDBFDF80000000], [3 x float] [float 0x3FE3060780000000, float 0xBFCB140140000000, float 0x3FC6B9FDC0000000], [3 x float] [float 0x3FE3060780000000, float 0xBFCB140140000000, float 0xBFC6B9FDC0000000], [3 x float] [float 0x3FD8B05320000000, float 0xBFCB140140000000, float 0xBFDDBFDF80000000], [3 x float] [float 0x3FA8989160000000, float 0xBFE016ACE0000000, float 0xBFD7E2A800000000], [3 x float] [float 0xBFC5EE1360000000, float 0xBFE016ACE0000000, float 0xBFD352DAA0000000], [3 x float] [float 0xBFD3A450A0000000, float 0xBFE016ACE0000000, float 0xBFBD861200000000], [3 x float] [float 0xBFD3A450A0000000, float 0xBFE016ACE0000000, float 0x3FBD861200000000], [3 x float] [float 0xBFC5EE1360000000, float 0xBFE016ACE0000000, float 0x3FD352DAA0000000], [3 x float] [float 0x3FA8989160000000, float 0xBFE016ACE0000000, float 0x3FD7E2A800000000], [3 x float] [float 0x3FD11D2E00000000, float 0xBFE016ACE0000000, float 0x3FD352DAA0000000], [3 x float] [float 0x3FD9CA7500000000, float 0xBFE016ACE0000000, float 0x3FBD8622C0000000], [3 x float] [float 0x3FD9CA7500000000, float 0xBFE016ACE0000000, float 0xBFBD8622C0000000], [3 x float] [float 0x3FD11D2E00000000, float 0xBFE016ACE0000000, float 0xBFD352DAA0000000], [3 x float] [float 0x3FA8989160000000, float 0xBFE24F3BA0000000, float 0xBFD7E2A800000000], [3 x float] [float 0xBFC5EE1360000000, float 0xBFE24F3BA0000000, float 0xBFD352DAA0000000], [3 x float] [float 0xBFD3A450A0000000, float 0xBFE24F3BA0000000, float 0xBFBD861200000000], [3 x float] [float 0xBFD3A450A0000000, float 0xBFE24F3BA0000000, float 0x3FBD861200000000], [3 x float] [float 0xBFC5EE1360000000, float 0xBFE24F3BA0000000, float 0x3FD352DAA0000000], [3 x float] [float 0x3FA8989160000000, float 0xBFE24F3BA0000000, float 0x3FD7E2A800000000], [3 x float] [float 0x3FD11D2E00000000, float 0xBFE24F3BA0000000, float 0x3FD352DAA0000000], [3 x float] [float 0x3FD9CA7500000000, float 0xBFE24F3BA0000000, float 0x3FBD8622C0000000], [3 x float] [float 0x3FD9CA7500000000, float 0xBFE24F3BA0000000, float 0xBFBD8622C0000000], [3 x float] [float 0x3FD11D2E00000000, float 0xBFE24F3BA0000000, float 0xBFD352DAA0000000], [3 x float] [float 0x3FA8989160000000, float 0x3FE24F3BA0000000, float 0xBFE7B3B540000000], [3 x float] [float 0xBFD8C9F300000000, float 0x3FE24F3BA0000000, float 0xBFE32CE040000000], [3 x float] [float 0xBFE5013220000000, float 0x3FE24F3BA0000000, float 0xBFCD4C1A80000000], [3 x float] [float 0xBFE5013220000000, float 0x3FE24F3BA0000000, float 0x3FCD4C1A80000000], [3 x float] [float 0xBFD8C9F300000000, float 0x3FE24F3BA0000000, float 0x3FE32CE040000000], [3 x float] [float 0x3FA8989160000000, float 0x3FE24F3BA0000000, float 0x3FE7B3B540000000], [3 x float] [float 0x3FDEF01760000000, float 0x3FE24F3BA0000000, float 0x3FE32CE040000000], [3 x float] [float 0x3FE8144460000000, float 0x3FE24F3BA0000000, float 0x3FCD4C1A80000000], [3 x float] [float 0x3FE8144460000000, float 0x3FE24F3BA0000000, float 0xBFCD4C1A80000000], [3 x float] [float 0x3FDEF01760000000, float 0x3FE24F3BA0000000, float 0xBFE32CE040000000], [3 x float] [float 0x3FA8989160000000, float 0x3FC62B1700000000, float 0xBFE5036860000000], [3 x float] [float 0xBFD5A0CF20000000, float 0x3FC62B1700000000, float 0xBFE1000860000000], [3 x float] [float 0xBFE27294E0000000, float 0x3FC62B1700000000, float 0xBFC9F950C0000000], [3 x float] [float 0xBFE27294E0000000, float 0x3FC62B1700000000, float 0x3FC9F950C0000000], [3 x float] [float 0xBFD5A0CF20000000, float 0x3FC62B1700000000, float 0x3FE1000860000000], [3 x float] [float 0x3FA8989160000000, float 0x3FC62B1700000000, float 0x3FE5036860000000], [3 x float] [float 0x3FDBC6EF40000000, float 0x3FC62B1700000000, float 0x3FE1000860000000], [3 x float] [float 0x3FE585A700000000, float 0x3FC62B1700000000, float 0x3FC9F950C0000000], [3 x float] [float 0x3FE585A700000000, float 0x3FC62B1700000000, float 0xBFC9F950C0000000], [3 x float] [float 0x3FDBC6EF40000000, float 0x3FC62B1700000000, float 0xBFE1000860000000], [3 x float] [float 0x3FA8989160000000, float 0xBFC72FCAC0000000, float 0xBFE099DAA0000000], [3 x float] [float 0xBFD070EF60000000, float 0xBFC72FCAC0000000, float 0xBFDADC65C0000000], [3 x float] [float 0xBFDC80A180000000, float 0xBFC72FCAC0000000, float 0xBFC4851A80000000], [3 x float] [float 0xBFDC80A180000000, float 0xBFC72FCAC0000000, float 0x3FC4851A80000000], [3 x float] [float 0xBFD070EF60000000, float 0xBFC72FCAC0000000, float 0x3FDADC65C0000000], [3 x float] [float 0x3FA8989160000000, float 0xBFC72FCAC0000000, float 0x3FE099DAA0000000], [3 x float] [float 0x3FD69713A0000000, float 0xBFC72FCAC0000000, float 0x3FDADC65C0000000], [3 x float] [float 0x3FE15362E0000000, float 0xBFC72FCAC0000000, float 0x3FC4851A80000000], [3 x float] [float 0x3FE15362E0000000, float 0xBFC72FCAC0000000, float 0xBFC48522E0000000], [3 x float] [float 0x3FD69713A0000000, float 0xBFC72FCAC0000000, float 0xBFDADC65C0000000], [3 x float] [float 0x3FA8989160000000, float 0xBFDD863380000000, float 0xBFD44DA900000000], [3 x float] [float 0xBFC1B81300000000, float 0xBFDD863380000000, float 0xBFD06D00C0000000], [3 x float] [float 0xBFD03C3620000000, float 0xBFDD863380000000, float 0xBFB918B0E0000000], [3 x float] [float 0xBFD03C3620000000, float 0xBFDD863380000000, float 0x3FB918B0E0000000], [3 x float] [float 0xBFC1B81300000000, float 0xBFDD863380000000, float 0x3FD06D00C0000000], [3 x float] [float 0x3FA8989160000000, float 0xBFDD863380000000, float 0x3FD44DA900000000], [3 x float] [float 0x3FCE045BA0000000, float 0xBFDD863380000000, float 0x3FD06D00C0000000], [3 x float] [float 0x3FD6625A60000000, float 0xBFDD863380000000, float 0x3FB918B0E0000000], [3 x float] [float 0x3FD6625A60000000, float 0xBFDD863380000000, float 0xBFB918B0E0000000], [3 x float] [float 0x3FCE045BA0000000, float 0xBFDD863380000000, float 0xBFD06D00C0000000], [3 x float] [float 0xBFE3EA7260000000, float 0x3FD6BD9020000000, float 0x3FD356A7A0000000], [3 x float] [float 0xBFDC9799E0000000, float 0x3FD6BBB200000000, float 0x3FE164CF80000000], [3 x float] [float 0xBFE35A3C20000000, float 0x3FD0A3E7E0000000, float 0x3FD2DE3320000000], [3 x float] [float 0xBFDBCB4280000000, float 0x3FD0A21640000000, float 0x3FE0EECE20000000], [3 x float] [float 0xBFE781E040000000, float 0x3FD60C1340000000, float 0x3FDA025C00000000], [3 x float] [float 0xBFE294BE00000000, float 0x3FD60A2880000000, float 0x3FE3C71920000000], [3 x float] [float 0xBFE70ABB40000000, float 0x3FD0CCAF80000000, float 0x3FD952B900000000], [3 x float] [float 0xBFE21BEB20000000, float 0x3FD0CABC60000000, float 0x3FE3719720000000], [3 x float] [float 0xBFE9DFAA80000000, float 0x3FD1515CE0000000, float 0x3FDE64C720000000], [3 x float] [float 0xBFE565ADE0000000, float 0x3FD14FDF40000000, float 0x3FE5599AA0000000], [3 x float] [float 0xBFE8011D40000000, float 0x3FCDCFD4C0000000, float 0x3FDBAB0420000000], [3 x float] [float 0xBFE38589A0000000, float 0x3FCDCCD100000000, float 0x3FE3FEE920000000], [3 x float] [float 0xBFE997BFA0000000, float 0x3FC1C14840000000, float 0x3FDF4B8BE0000000], [3 x float] [float 0xBFE5BC07E0000000, float 0x3FC1BE6600000000, float 0x3FE4F36CE0000000], [3 x float] [float 0xBFE7ADC0A0000000, float 0x3FC5233580000000, float 0x3FDC83F0C0000000], [3 x float] [float 0xBFE3D204A0000000, float 0x3FC5205360000000, float 0x3FE38FA380000000], [3 x float] [float 0xBFE4928180000000, float 0xBFC5135120000000, float 0x3FD9F327A0000000], [3 x float] [float 0xBFE1A28780000000, float 0xBFC5157AC0000000, float 0x3FE1036000000000], [3 x float] [float 0xBFE393B5C0000000, float 0xBFBEC7DA20000000, float 0x3FD8826AA0000000], [3 x float] [float 0xBFE0A47240000000, float 0xBFBECC1CA0000000, float 0x3FE04A0800000000], [3 x float] [float 0xBFDE4D9840000000, float 0xBFD4CFA260000000, float 0x3FD2A86D80000000], [3 x float] [float 0xBFD8FB6560000000, float 0xBFD4D084E0000000, float 0x3FD9F8DB40000000], [3 x float] [float 0xBFDE71C100000000, float 0xBFD1B71760000000, float 0x3FD2C52600000000], [3 x float] [float 0xBFD9222D60000000, float 0xBFD1B7F9E0000000, float 0x3FDA11F0C0000000], [3 x float] [float 0xBFDA8F1900000000, float 0xBFD12DF0E0000000, float 0x3FCD493000000000], [3 x float] [float 0xBFD400EAE0000000, float 0xBFD12F09E0000000, float 0x3FD7A758A0000000], [3 x float] [float 0xBFD8EC0720000000, float 0xBFD43F0780000000, float 0x3FCAEE2860000000], [3 x float] [float 0xBFD2601360000000, float 0xBFD4401C40000000, float 0x3FD676C060000000]], align 16
; Function Attrs: noinline nounwind optnone
define hidden void @vc_render(%struct.Olivec_Canvas* noalias sret align 4 %0, float %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.Vector3, align 4
  %10 = alloca %struct.Vector3, align 4
  %11 = alloca %struct.Vector3, align 4
  %12 = alloca %struct.Vector3, align 4
  %13 = alloca %struct.Vector3, align 4
  %14 = alloca %struct.Vector3, align 4
  %15 = alloca %struct.Vector2, align 4
  %16 = alloca %struct.Vector2, align 4
  %17 = alloca %struct.Vector2, align 4
  %18 = alloca %struct.Vector2, align 4
  %19 = alloca %struct.Vector2, align 4
  %20 = alloca %struct.Vector2, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca float, align 4
  %38 = alloca float, align 4
  %39 = alloca float, align 4
  %40 = alloca i32, align 4
  store float %1, float* %3, align 4
  %41 = load float, float* %3, align 4
  %42 = fpext float %41 to double
  %43 = fmul double 0x3FE921FB54442EEA, %42
  %44 = load float, float* @angle, align 4
  %45 = fpext float %44 to double
  %46 = fadd double %45, %43
  %47 = fptrunc double %46 to float
  store float %47, float* @angle, align 4
  call void @olivec_canvas(%struct.Olivec_Canvas* sret align 4 %0, i32* getelementptr inbounds ([691200 x i32], [691200 x i32]* @pixels, i32 0, i32 0), i32 960, i32 720, i32 960)
  call void @olivec_fill(%struct.Olivec_Canvas* byval(%struct.Olivec_Canvas) align 4 %0, i32 -15198184)
  store i32 0, i32* %4, align 4
  br label %48

48:                                               ; preds = %54, %2
  %49 = load i32, i32* %4, align 4
  %50 = icmp ult i32 %49, 691200
  br i1 %50, label %51, label %57

51:                                               ; preds = %48
  %52 = load i32, i32* %4, align 4
  %53 = getelementptr inbounds [691200 x float], [691200 x float]* @zbuffer, i32 0, i32 %52
  store float 0.000000e+00, float* %53, align 4
  br label %54

54:                                               ; preds = %51
  %55 = load i32, i32* %4, align 4
  %56 = add i32 %55, 1
  store i32 %56, i32* %4, align 4
  br label %48

57:                                               ; preds = %48
  store i32 0, i32* %5, align 4
  br label %58

58:                                               ; preds = %292, %57
  %59 = load i32, i32* %5, align 4
  %60 = icmp ult i32 %59, 224
  br i1 %60, label %61, label %295

61:                                               ; preds = %58
  %62 = load i32, i32* %5, align 4
  %63 = getelementptr inbounds [224 x [3 x i32]], [224 x [3 x i32]]* @faces, i32 0, i32 %62
  %64 = getelementptr inbounds [3 x i32], [3 x i32]* %63, i32 0, i32 0
  %65 = load i32, i32* %64, align 4
  store i32 %65, i32* %6, align 4
  %66 = load i32, i32* %5, align 4
  %67 = getelementptr inbounds [224 x [3 x i32]], [224 x [3 x i32]]* @faces, i32 0, i32 %66
  %68 = getelementptr inbounds [3 x i32], [3 x i32]* %67, i32 0, i32 1
  %69 = load i32, i32* %68, align 4
  store i32 %69, i32* %7, align 4
  %70 = load i32, i32* %5, align 4
  %71 = getelementptr inbounds [224 x [3 x i32]], [224 x [3 x i32]]* @faces, i32 0, i32 %70
  %72 = getelementptr inbounds [3 x i32], [3 x i32]* %71, i32 0, i32 2
  %73 = load i32, i32* %72, align 4
  store i32 %73, i32* %8, align 4
  %74 = load i32, i32* %6, align 4
  %75 = getelementptr inbounds [118 x [3 x float]], [118 x [3 x float]]* @vertices, i32 0, i32 %74
  %76 = getelementptr inbounds [3 x float], [3 x float]* %75, i32 0, i32 0
  %77 = load float, float* %76, align 4
  %78 = load i32, i32* %6, align 4
  %79 = getelementptr inbounds [118 x [3 x float]], [118 x [3 x float]]* @vertices, i32 0, i32 %78
  %80 = getelementptr inbounds [3 x float], [3 x float]* %79, i32 0, i32 1
  %81 = load float, float* %80, align 4
  %82 = load i32, i32* %6, align 4
  %83 = getelementptr inbounds [118 x [3 x float]], [118 x [3 x float]]* @vertices, i32 0, i32 %82
  %84 = getelementptr inbounds [3 x float], [3 x float]* %83, i32 0, i32 2
  %85 = load float, float* %84, align 4
  call void @make_vector3(%struct.Vector3* sret align 4 %10, float %77, float %81, float %85)
  %86 = load float, float* @angle, align 4
  call void @rotate_y(%struct.Vector3* sret align 4 %9, %struct.Vector3* byval(%struct.Vector3) align 4 %10, float %86)
  %87 = load i32, i32* %7, align 4
  %88 = getelementptr inbounds [118 x [3 x float]], [118 x [3 x float]]* @vertices, i32 0, i32 %87
  %89 = getelementptr inbounds [3 x float], [3 x float]* %88, i32 0, i32 0
  %90 = load float, float* %89, align 4
  %91 = load i32, i32* %7, align 4
  %92 = getelementptr inbounds [118 x [3 x float]], [118 x [3 x float]]* @vertices, i32 0, i32 %91
  %93 = getelementptr inbounds [3 x float], [3 x float]* %92, i32 0, i32 1
  %94 = load float, float* %93, align 4
  %95 = load i32, i32* %7, align 4
  %96 = getelementptr inbounds [118 x [3 x float]], [118 x [3 x float]]* @vertices, i32 0, i32 %95
  %97 = getelementptr inbounds [3 x float], [3 x float]* %96, i32 0, i32 2
  %98 = load float, float* %97, align 4
  call void @make_vector3(%struct.Vector3* sret align 4 %12, float %90, float %94, float %98)
  %99 = load float, float* @angle, align 4
  call void @rotate_y(%struct.Vector3* sret align 4 %11, %struct.Vector3* byval(%struct.Vector3) align 4 %12, float %99)
  %100 = load i32, i32* %8, align 4
  %101 = getelementptr inbounds [118 x [3 x float]], [118 x [3 x float]]* @vertices, i32 0, i32 %100
  %102 = getelementptr inbounds [3 x float], [3 x float]* %101, i32 0, i32 0
  %103 = load float, float* %102, align 4
  %104 = load i32, i32* %8, align 4
  %105 = getelementptr inbounds [118 x [3 x float]], [118 x [3 x float]]* @vertices, i32 0, i32 %104
  %106 = getelementptr inbounds [3 x float], [3 x float]* %105, i32 0, i32 1
  %107 = load float, float* %106, align 4
  %108 = load i32, i32* %8, align 4
  %109 = getelementptr inbounds [118 x [3 x float]], [118 x [3 x float]]* @vertices, i32 0, i32 %108
  %110 = getelementptr inbounds [3 x float], [3 x float]* %109, i32 0, i32 2
  %111 = load float, float* %110, align 4
  call void @make_vector3(%struct.Vector3* sret align 4 %14, float %103, float %107, float %111)
  %112 = load float, float* @angle, align 4
  call void @rotate_y(%struct.Vector3* sret align 4 %13, %struct.Vector3* byval(%struct.Vector3) align 4 %14, float %112)
  %113 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %9, i32 0, i32 2
  %114 = load float, float* %113, align 4
  %115 = fpext float %114 to double
  %116 = fadd double %115, 1.500000e+00
  %117 = fptrunc double %116 to float
  store float %117, float* %113, align 4
  %118 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %11, i32 0, i32 2
  %119 = load float, float* %118, align 4
  %120 = fpext float %119 to double
  %121 = fadd double %120, 1.500000e+00
  %122 = fptrunc double %121 to float
  store float %122, float* %118, align 4
  %123 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %13, i32 0, i32 2
  %124 = load float, float* %123, align 4
  %125 = fpext float %124 to double
  %126 = fadd double %125, 1.500000e+00
  %127 = fptrunc double %126 to float
  store float %127, float* %123, align 4
  call void @project_3d_2d(%struct.Vector2* sret align 4 %16, %struct.Vector3* byval(%struct.Vector3) align 4 %9)
  call void @project_2d_scr(%struct.Vector2* sret align 4 %15, %struct.Vector2* byval(%struct.Vector2) align 4 %16)
  call void @project_3d_2d(%struct.Vector2* sret align 4 %18, %struct.Vector3* byval(%struct.Vector3) align 4 %11)
  call void @project_2d_scr(%struct.Vector2* sret align 4 %17, %struct.Vector2* byval(%struct.Vector2) align 4 %18)
  call void @project_3d_2d(%struct.Vector2* sret align 4 %20, %struct.Vector3* byval(%struct.Vector3) align 4 %13)
  call void @project_2d_scr(%struct.Vector2* sret align 4 %19, %struct.Vector2* byval(%struct.Vector2) align 4 %20)
  %128 = getelementptr inbounds %struct.Vector2, %struct.Vector2* %15, i32 0, i32 0
  %129 = load float, float* %128, align 4
  %130 = fptosi float %129 to i32
  store i32 %130, i32* %21, align 4
  %131 = getelementptr inbounds %struct.Vector2, %struct.Vector2* %17, i32 0, i32 0
  %132 = load float, float* %131, align 4
  %133 = fptosi float %132 to i32
  store i32 %133, i32* %22, align 4
  %134 = getelementptr inbounds %struct.Vector2, %struct.Vector2* %19, i32 0, i32 0
  %135 = load float, float* %134, align 4
  %136 = fptosi float %135 to i32
  store i32 %136, i32* %23, align 4
  %137 = getelementptr inbounds %struct.Vector2, %struct.Vector2* %15, i32 0, i32 1
  %138 = load float, float* %137, align 4
  %139 = fptosi float %138 to i32
  store i32 %139, i32* %24, align 4
  %140 = getelementptr inbounds %struct.Vector2, %struct.Vector2* %17, i32 0, i32 1
  %141 = load float, float* %140, align 4
  %142 = fptosi float %141 to i32
  store i32 %142, i32* %25, align 4
  %143 = getelementptr inbounds %struct.Vector2, %struct.Vector2* %19, i32 0, i32 1
  %144 = load float, float* %143, align 4
  %145 = fptosi float %144 to i32
  store i32 %145, i32* %26, align 4
  %146 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 1
  %147 = load i32, i32* %146, align 4
  %148 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 2
  %149 = load i32, i32* %148, align 4
  %150 = load i32, i32* %21, align 4
  %151 = load i32, i32* %24, align 4
  %152 = load i32, i32* %22, align 4
  %153 = load i32, i32* %25, align 4
  %154 = load i32, i32* %23, align 4
  %155 = load i32, i32* %26, align 4
  %156 = call zeroext i1 @olivec_normalize_triangle(i32 %147, i32 %149, i32 %150, i32 %151, i32 %152, i32 %153, i32 %154, i32 %155, i32* %27, i32* %28, i32* %29, i32* %30)
  br i1 %156, label %157, label %291

157:                                              ; preds = %61
  %158 = load i32, i32* %29, align 4
  store i32 %158, i32* %31, align 4
  br label %159

159:                                              ; preds = %287, %157
  %160 = load i32, i32* %31, align 4
  %161 = load i32, i32* %30, align 4
  %162 = icmp sle i32 %160, %161
  br i1 %162, label %163, label %290

163:                                              ; preds = %159
  %164 = load i32, i32* %27, align 4
  store i32 %164, i32* %32, align 4
  br label %165

165:                                              ; preds = %283, %163
  %166 = load i32, i32* %32, align 4
  %167 = load i32, i32* %28, align 4
  %168 = icmp sle i32 %166, %167
  br i1 %168, label %169, label %286

169:                                              ; preds = %165
  %170 = load i32, i32* %21, align 4
  %171 = load i32, i32* %24, align 4
  %172 = load i32, i32* %22, align 4
  %173 = load i32, i32* %25, align 4
  %174 = load i32, i32* %23, align 4
  %175 = load i32, i32* %26, align 4
  %176 = load i32, i32* %32, align 4
  %177 = load i32, i32* %31, align 4
  %178 = call zeroext i1 @olivec_barycentric(i32 %170, i32 %171, i32 %172, i32 %173, i32 %174, i32 %175, i32 %176, i32 %177, i32* %33, i32* %34, i32* %35)
  br i1 %178, label %179, label %282

179:                                              ; preds = %169
  %180 = load i32, i32* %35, align 4
  %181 = load i32, i32* %33, align 4
  %182 = sub nsw i32 %180, %181
  %183 = load i32, i32* %34, align 4
  %184 = sub nsw i32 %182, %183
  store i32 %184, i32* %36, align 4
  %185 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %9, i32 0, i32 2
  %186 = load float, float* %185, align 4
  %187 = fdiv float 1.000000e+00, %186
  %188 = load i32, i32* %33, align 4
  %189 = sitofp i32 %188 to float
  %190 = fmul float %187, %189
  %191 = load i32, i32* %35, align 4
  %192 = sitofp i32 %191 to float
  %193 = fdiv float %190, %192
  %194 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %11, i32 0, i32 2
  %195 = load float, float* %194, align 4
  %196 = fdiv float 1.000000e+00, %195
  %197 = load i32, i32* %34, align 4
  %198 = sitofp i32 %197 to float
  %199 = fmul float %196, %198
  %200 = load i32, i32* %35, align 4
  %201 = sitofp i32 %200 to float
  %202 = fdiv float %199, %201
  %203 = fadd float %193, %202
  %204 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %13, i32 0, i32 2
  %205 = load float, float* %204, align 4
  %206 = fdiv float 1.000000e+00, %205
  %207 = load i32, i32* %36, align 4
  %208 = sitofp i32 %207 to float
  %209 = fmul float %206, %208
  %210 = load i32, i32* %35, align 4
  %211 = sitofp i32 %210 to float
  %212 = fdiv float %209, %211
  %213 = fadd float %203, %212
  store float %213, float* %37, align 4
  store float 0x3FB99999A0000000, float* %38, align 4
  store float 5.000000e+00, float* %39, align 4
  %214 = load float, float* %39, align 4
  %215 = fdiv float 1.000000e+00, %214
  %216 = load float, float* %37, align 4
  %217 = fcmp olt float %215, %216
  br i1 %217, label %218, label %281

218:                                              ; preds = %179
  %219 = load float, float* %37, align 4
  %220 = load float, float* %38, align 4
  %221 = fdiv float 1.000000e+00, %220
  %222 = fcmp olt float %219, %221
  br i1 %222, label %223, label %281

223:                                              ; preds = %218
  %224 = load float, float* %37, align 4
  %225 = load i32, i32* %31, align 4
  %226 = mul nsw i32 %225, 960
  %227 = load i32, i32* %32, align 4
  %228 = add nsw i32 %226, %227
  %229 = getelementptr inbounds [691200 x float], [691200 x float]* @zbuffer, i32 0, i32 %228
  %230 = load float, float* %229, align 4
  %231 = fcmp ogt float %224, %230
  br i1 %231, label %232, label %281

232:                                              ; preds = %223
  %233 = load float, float* %37, align 4
  %234 = load i32, i32* %31, align 4
  %235 = mul nsw i32 %234, 960
  %236 = load i32, i32* %32, align 4
  %237 = add nsw i32 %235, %236
  %238 = getelementptr inbounds [691200 x float], [691200 x float]* @zbuffer, i32 0, i32 %237
  store float %233, float* %238, align 4
  %239 = load i32, i32* %33, align 4
  %240 = load i32, i32* %34, align 4
  %241 = load i32, i32* %35, align 4
  %242 = call i32 @mix_colors3(i32 -15197953, i32 -15139048, i32 -59368, i32 %239, i32 %240, i32 %241)
  %243 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 0
  %244 = load i32*, i32** %243, align 4
  %245 = load i32, i32* %31, align 4
  %246 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 3
  %247 = load i32, i32* %246, align 4
  %248 = mul i32 %245, %247
  %249 = load i32, i32* %32, align 4
  %250 = add i32 %248, %249
  %251 = getelementptr inbounds i32, i32* %244, i32 %250
  store i32 %242, i32* %251, align 4
  %252 = load float, float* %37, align 4
  %253 = fdiv float 1.000000e+00, %252
  store float %253, float* %37, align 4
  %254 = load float, float* %37, align 4
  %255 = fpext float %254 to double
  %256 = fcmp oge double %255, 1.000000e+00
  br i1 %256, label %257, label %280

257:                                              ; preds = %232
  %258 = load float, float* %37, align 4
  %259 = fpext float %258 to double
  %260 = fsub double %259, 1.000000e+00
  %261 = fptrunc double %260 to float
  store float %261, float* %37, align 4
  %262 = load float, float* %37, align 4
  %263 = fmul float %262, 2.550000e+02
  %264 = fptoui float %263 to i32
  store i32 %264, i32* %40, align 4
  %265 = load i32, i32* %40, align 4
  %266 = icmp ugt i32 %265, 255
  br i1 %266, label %267, label %268

267:                                              ; preds = %257
  store i32 255, i32* %40, align 4
  br label %268

268:                                              ; preds = %267, %257
  %269 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 0
  %270 = load i32*, i32** %269, align 4
  %271 = load i32, i32* %31, align 4
  %272 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 3
  %273 = load i32, i32* %272, align 4
  %274 = mul i32 %271, %273
  %275 = load i32, i32* %32, align 4
  %276 = add i32 %274, %275
  %277 = getelementptr inbounds i32, i32* %270, i32 %276
  %278 = load i32, i32* %40, align 4
  %279 = shl i32 %278, 24
  call void @olivec_blend_color(i32* %277, i32 %279)
  br label %280

280:                                              ; preds = %268, %232
  br label %281

281:                                              ; preds = %280, %223, %218, %179
  br label %282

282:                                              ; preds = %281, %169
  br label %283

283:                                              ; preds = %282
  %284 = load i32, i32* %32, align 4
  %285 = add nsw i32 %284, 1
  store i32 %285, i32* %32, align 4
  br label %165

286:                                              ; preds = %165
  br label %287

287:                                              ; preds = %286
  %288 = load i32, i32* %31, align 4
  %289 = add nsw i32 %288, 1
  store i32 %289, i32* %31, align 4
  br label %159

290:                                              ; preds = %159
  br label %291

291:                                              ; preds = %290, %61
  br label %292

292:                                              ; preds = %291
  %293 = load i32, i32* %5, align 4
  %294 = add i32 %293, 1
  store i32 %294, i32* %5, align 4
  br label %58

295:                                              ; preds = %58
  ret void
}
; Function Attrs: noinline nounwind optnone
define internal void @olivec_canvas(%struct.Olivec_Canvas* noalias sret align 4 %0, i32* %1, i32 %2, i32 %3, i32 %4) #0 {
  %6 = alloca i32*, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32* %1, i32** %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i32 %4, i32* %9, align 4
  %10 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 0
  %11 = load i32*, i32** %6, align 4
  store i32* %11, i32** %10, align 4
  %12 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 1
  %13 = load i32, i32* %7, align 4
  store i32 %13, i32* %12, align 4
  %14 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 2
  %15 = load i32, i32* %8, align 4
  store i32 %15, i32* %14, align 4
  %16 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 3
  %17 = load i32, i32* %9, align 4
  store i32 %17, i32* %16, align 4
  ret void
}
; Function Attrs: noinline nounwind optnone
define internal void @olivec_fill(%struct.Olivec_Canvas* byval(%struct.Olivec_Canvas) align 4 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %1, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %6

6:                                                ; preds = %32, %2
  %7 = load i32, i32* %4, align 4
  %8 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 2
  %9 = load i32, i32* %8, align 4
  %10 = icmp ult i32 %7, %9
  br i1 %10, label %11, label %35

11:                                               ; preds = %6
  store i32 0, i32* %5, align 4
  br label %12

12:                                               ; preds = %28, %11
  %13 = load i32, i32* %5, align 4
  %14 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 1
  %15 = load i32, i32* %14, align 4
  %16 = icmp ult i32 %13, %15
  br i1 %16, label %17, label %31

17:                                               ; preds = %12
  %18 = load i32, i32* %3, align 4
  %19 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 0
  %20 = load i32*, i32** %19, align 4
  %21 = load i32, i32* %4, align 4
  %22 = getelementptr inbounds %struct.Olivec_Canvas, %struct.Olivec_Canvas* %0, i32 0, i32 3
  %23 = load i32, i32* %22, align 4
  %24 = mul i32 %21, %23
  %25 = load i32, i32* %5, align 4
  %26 = add i32 %24, %25
  %27 = getelementptr inbounds i32, i32* %20, i32 %26
  store i32 %18, i32* %27, align 4
  br label %28

28:                                               ; preds = %17
  %29 = load i32, i32* %5, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* %5, align 4
  br label %12

31:                                               ; preds = %12
  br label %32

32:                                               ; preds = %31
  %33 = load i32, i32* %4, align 4
  %34 = add i32 %33, 1
  store i32 %34, i32* %4, align 4
  br label %6

35:                                               ; preds = %6
  ret void
}
; Function Attrs: noinline nounwind optnone
define internal void @rotate_y(%struct.Vector3* noalias sret align 4 %0, %struct.Vector3* byval(%struct.Vector3) align 4 %1, float %2) #0 {
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store float %2, float* %4, align 4
  %7 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 2
  %8 = load float, float* %7, align 4
  %9 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 0
  %10 = load float, float* %9, align 4
  %11 = call float @atan2f(float %8, float %10) #3
  %12 = load float, float* %4, align 4
  %13 = fadd float %11, %12
  store float %13, float* %5, align 4
  %14 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 0
  %15 = load float, float* %14, align 4
  %16 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 0
  %17 = load float, float* %16, align 4
  %18 = fmul float %15, %17
  %19 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 2
  %20 = load float, float* %19, align 4
  %21 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 2
  %22 = load float, float* %21, align 4
  %23 = fmul float %20, %22
  %24 = fadd float %18, %23
  %25 = call float @llvm.sqrt.f32(float %24)
  store float %25, float* %6, align 4
  %26 = load float, float* %5, align 4
  %27 = call float @llvm.cos.f32(float %26)
  %28 = load float, float* %6, align 4
  %29 = fmul float %27, %28
  %30 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 1
  %31 = load float, float* %30, align 4
  %32 = load float, float* %5, align 4
  %33 = call float @llvm.sin.f32(float %32)
  %34 = load float, float* %6, align 4
  %35 = fmul float %33, %34
  call void @make_vector3(%struct.Vector3* sret align 4 %0, float %29, float %31, float %35)
  ret void
}
; Function Attrs: noinline nounwind optnone
define internal void @make_vector3(%struct.Vector3* noalias sret align 4 %0, float %1, float %2, float %3) #0 {
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  store float %1, float* %5, align 4
  store float %2, float* %6, align 4
  store float %3, float* %7, align 4
  %8 = load float, float* %5, align 4
  %9 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %0, i32 0, i32 0
  store float %8, float* %9, align 4
  %10 = load float, float* %6, align 4
  %11 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %0, i32 0, i32 1
  store float %10, float* %11, align 4
  %12 = load float, float* %7, align 4
  %13 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %0, i32 0, i32 2
  store float %12, float* %13, align 4
  ret void
}
; Function Attrs: noinline nounwind optnone
define internal void @project_2d_scr(%struct.Vector2* noalias sret align 4 %0, %struct.Vector2* byval(%struct.Vector2) align 4 %1) #0 {
  %3 = getelementptr inbounds %struct.Vector2, %struct.Vector2* %1, i32 0, i32 0
  %4 = load float, float* %3, align 4
  %5 = fadd float %4, 1.000000e+00
  %6 = fdiv float %5, 2.000000e+00
  %7 = fmul float %6, 9.600000e+02
  %8 = getelementptr inbounds %struct.Vector2, %struct.Vector2* %1, i32 0, i32 1
  %9 = load float, float* %8, align 4
  %10 = fadd float %9, 1.000000e+00
  %11 = fdiv float %10, 2.000000e+00
  %12 = fsub float 1.000000e+00, %11
  %13 = fmul float %12, 7.200000e+02
  call void @make_vector2(%struct.Vector2* sret align 4 %0, float %7, float %13)
  ret void
}
; Function Attrs: noinline nounwind optnone
define internal void @project_3d_2d(%struct.Vector2* noalias sret align 4 %0, %struct.Vector3* byval(%struct.Vector3) align 4 %1) #0 {
  %3 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 2
  %4 = load float, float* %3, align 4
  %5 = fcmp olt float %4, 0.000000e+00
  br i1 %5, label %6, label %11

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 2
  %8 = load float, float* %7, align 4
  %9 = fneg float %8
  %10 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 2
  store float %9, float* %10, align 4
  br label %11

11:                                               ; preds = %6, %2
  %12 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 2
  %13 = load float, float* %12, align 4
  %14 = fpext float %13 to double
  %15 = fcmp olt double %14, 0x3EB0C6F7A0B5ED8D
  br i1 %15, label %16, label %22

16:                                               ; preds = %11
  %17 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 2
  %18 = load float, float* %17, align 4
  %19 = fpext float %18 to double
  %20 = fadd double %19, 0x3EB0C6F7A0B5ED8D
  %21 = fptrunc double %20 to float
  store float %21, float* %17, align 4
  br label %22

22:                                               ; preds = %16, %11
  %23 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 0
  %24 = load float, float* %23, align 4
  %25 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 2
  %26 = load float, float* %25, align 4
  %27 = fdiv float %24, %26
  %28 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 1
  %29 = load float, float* %28, align 4
  %30 = getelementptr inbounds %struct.Vector3, %struct.Vector3* %1, i32 0, i32 2
  %31 = load float, float* %30, align 4
  %32 = fdiv float %29, %31
  call void @make_vector2(%struct.Vector2* sret align 4 %0, float %27, float %32)
  ret void
}
; Function Attrs: noinline nounwind optnone
define internal zeroext i1 @olivec_normalize_triangle(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32* %8, i32* %9, i32* %10, i32* %11) #0 {
  %13 = alloca i1, align 1
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32*, align 4
  %23 = alloca i32*, align 4
  %24 = alloca i32*, align 4
  %25 = alloca i32*, align 4
  store i32 %0, i32* %14, align 4
  store i32 %1, i32* %15, align 4
  store i32 %2, i32* %16, align 4
  store i32 %3, i32* %17, align 4
  store i32 %4, i32* %18, align 4
  store i32 %5, i32* %19, align 4
  store i32 %6, i32* %20, align 4
  store i32 %7, i32* %21, align 4
  store i32* %8, i32** %22, align 4
  store i32* %9, i32** %23, align 4
  store i32* %10, i32** %24, align 4
  store i32* %11, i32** %25, align 4
  %26 = load i32, i32* %16, align 4
  %27 = load i32*, i32** %22, align 4
  store i32 %26, i32* %27, align 4
  %28 = load i32, i32* %16, align 4
  %29 = load i32*, i32** %23, align 4
  store i32 %28, i32* %29, align 4
  %30 = load i32*, i32** %22, align 4
  %31 = load i32, i32* %30, align 4
  %32 = load i32, i32* %18, align 4
  %33 = icmp sgt i32 %31, %32
  br i1 %33, label %34, label %37

34:                                               ; preds = %12
  %35 = load i32, i32* %18, align 4
  %36 = load i32*, i32** %22, align 4
  store i32 %35, i32* %36, align 4
  br label %37

37:                                               ; preds = %34, %12
  %38 = load i32*, i32** %22, align 4
  %39 = load i32, i32* %38, align 4
  %40 = load i32, i32* %20, align 4
  %41 = icmp sgt i32 %39, %40
  br i1 %41, label %42, label %45

42:                                               ; preds = %37
  %43 = load i32, i32* %20, align 4
  %44 = load i32*, i32** %22, align 4
  store i32 %43, i32* %44, align 4
  br label %45

45:                                               ; preds = %42, %37
  %46 = load i32*, i32** %23, align 4
  %47 = load i32, i32* %46, align 4
  %48 = load i32, i32* %18, align 4
  %49 = icmp slt i32 %47, %48
  br i1 %49, label %50, label %53

50:                                               ; preds = %45
  %51 = load i32, i32* %18, align 4
  %52 = load i32*, i32** %23, align 4
  store i32 %51, i32* %52, align 4
  br label %53

53:                                               ; preds = %50, %45
  %54 = load i32*, i32** %23, align 4
  %55 = load i32, i32* %54, align 4
  %56 = load i32, i32* %20, align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %58, label %61

58:                                               ; preds = %53
  %59 = load i32, i32* %20, align 4
  %60 = load i32*, i32** %23, align 4
  store i32 %59, i32* %60, align 4
  br label %61

61:                                               ; preds = %58, %53
  %62 = load i32*, i32** %22, align 4
  %63 = load i32, i32* %62, align 4
  %64 = icmp slt i32 %63, 0
  br i1 %64, label %65, label %67

65:                                               ; preds = %61
  %66 = load i32*, i32** %22, align 4
  store i32 0, i32* %66, align 4
  br label %67

67:                                               ; preds = %65, %61
  %68 = load i32*, i32** %22, align 4
  %69 = load i32, i32* %68, align 4
  %70 = load i32, i32* %14, align 4
  %71 = icmp uge i32 %69, %70
  br i1 %71, label %72, label %73

72:                                               ; preds = %67
  store i1 false, i1* %13, align 1
  br label %150

73:                                               ; preds = %67
  %74 = load i32*, i32** %23, align 4
  %75 = load i32, i32* %74, align 4
  %76 = icmp slt i32 %75, 0
  br i1 %76, label %77, label %78

77:                                               ; preds = %73
  store i1 false, i1* %13, align 1
  br label %150

78:                                               ; preds = %73
  %79 = load i32*, i32** %23, align 4
  %80 = load i32, i32* %79, align 4
  %81 = load i32, i32* %14, align 4
  %82 = icmp uge i32 %80, %81
  br i1 %82, label %83, label %87

83:                                               ; preds = %78
  %84 = load i32, i32* %14, align 4
  %85 = sub i32 %84, 1
  %86 = load i32*, i32** %23, align 4
  store i32 %85, i32* %86, align 4
  br label %87

87:                                               ; preds = %83, %78
  %88 = load i32, i32* %17, align 4
  %89 = load i32*, i32** %24, align 4
  store i32 %88, i32* %89, align 4
  %90 = load i32, i32* %17, align 4
  %91 = load i32*, i32** %25, align 4
  store i32 %90, i32* %91, align 4
  %92 = load i32*, i32** %24, align 4
  %93 = load i32, i32* %92, align 4
  %94 = load i32, i32* %19, align 4
  %95 = icmp sgt i32 %93, %94
  br i1 %95, label %96, label %99

96:                                               ; preds = %87
  %97 = load i32, i32* %19, align 4
  %98 = load i32*, i32** %24, align 4
  store i32 %97, i32* %98, align 4
  br label %99

99:                                               ; preds = %96, %87
  %100 = load i32*, i32** %24, align 4
  %101 = load i32, i32* %100, align 4
  %102 = load i32, i32* %21, align 4
  %103 = icmp sgt i32 %101, %102
  br i1 %103, label %104, label %107

104:                                              ; preds = %99
  %105 = load i32, i32* %21, align 4
  %106 = load i32*, i32** %24, align 4
  store i32 %105, i32* %106, align 4
  br label %107

107:                                              ; preds = %104, %99
  %108 = load i32*, i32** %25, align 4
  %109 = load i32, i32* %108, align 4
  %110 = load i32, i32* %19, align 4
  %111 = icmp slt i32 %109, %110
  br i1 %111, label %112, label %115

112:                                              ; preds = %107
  %113 = load i32, i32* %19, align 4
  %114 = load i32*, i32** %25, align 4
  store i32 %113, i32* %114, align 4
  br label %115

115:                                              ; preds = %112, %107
  %116 = load i32*, i32** %25, align 4
  %117 = load i32, i32* %116, align 4
  %118 = load i32, i32* %21, align 4
  %119 = icmp slt i32 %117, %118
  br i1 %119, label %120, label %123

120:                                              ; preds = %115
  %121 = load i32, i32* %21, align 4
  %122 = load i32*, i32** %25, align 4
  store i32 %121, i32* %122, align 4
  br label %123

123:                                              ; preds = %120, %115
  %124 = load i32*, i32** %24, align 4
  %125 = load i32, i32* %124, align 4
  %126 = icmp slt i32 %125, 0
  br i1 %126, label %127, label %129

127:                                              ; preds = %123
  %128 = load i32*, i32** %24, align 4
  store i32 0, i32* %128, align 4
  br label %129

129:                                              ; preds = %127, %123
  %130 = load i32*, i32** %24, align 4
  %131 = load i32, i32* %130, align 4
  %132 = load i32, i32* %15, align 4
  %133 = icmp uge i32 %131, %132
  br i1 %133, label %134, label %135

134:                                              ; preds = %129
  store i1 false, i1* %13, align 1
  br label %150

135:                                              ; preds = %129
  %136 = load i32*, i32** %25, align 4
  %137 = load i32, i32* %136, align 4
  %138 = icmp slt i32 %137, 0
  br i1 %138, label %139, label %140

139:                                              ; preds = %135
  store i1 false, i1* %13, align 1
  br label %150

140:                                              ; preds = %135
  %141 = load i32*, i32** %25, align 4
  %142 = load i32, i32* %141, align 4
  %143 = load i32, i32* %15, align 4
  %144 = icmp uge i32 %142, %143
  br i1 %144, label %145, label %149

145:                                              ; preds = %140
  %146 = load i32, i32* %15, align 4
  %147 = sub i32 %146, 1
  %148 = load i32*, i32** %25, align 4
  store i32 %147, i32* %148, align 4
  br label %149

149:                                              ; preds = %145, %140
  store i1 true, i1* %13, align 1
  br label %150

150:                                              ; preds = %149, %139, %134, %77, %72
  %151 = load i1, i1* %13, align 1
  ret i1 %151
}
; Function Attrs: noinline nounwind optnone
define internal zeroext i1 @olivec_barycentric(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32* %8, i32* %9, i32* %10) #0 {
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32*, align 4
  %21 = alloca i32*, align 4
  %22 = alloca i32*, align 4
  %23 = alloca i32, align 4
  store i32 %0, i32* %12, align 4
  store i32 %1, i32* %13, align 4
  store i32 %2, i32* %14, align 4
  store i32 %3, i32* %15, align 4
  store i32 %4, i32* %16, align 4
  store i32 %5, i32* %17, align 4
  store i32 %6, i32* %18, align 4
  store i32 %7, i32* %19, align 4
  store i32* %8, i32** %20, align 4
  store i32* %9, i32** %21, align 4
  store i32* %10, i32** %22, align 4
  %24 = load i32, i32* %12, align 4
  %25 = load i32, i32* %16, align 4
  %26 = sub nsw i32 %24, %25
  %27 = load i32, i32* %15, align 4
  %28 = load i32, i32* %17, align 4
  %29 = sub nsw i32 %27, %28
  %30 = mul nsw i32 %26, %29
  %31 = load i32, i32* %14, align 4
  %32 = load i32, i32* %16, align 4
  %33 = sub nsw i32 %31, %32
  %34 = load i32, i32* %13, align 4
  %35 = load i32, i32* %17, align 4
  %36 = sub nsw i32 %34, %35
  %37 = mul nsw i32 %33, %36
  %38 = sub nsw i32 %30, %37
  %39 = load i32*, i32** %22, align 4
  store i32 %38, i32* %39, align 4
  %40 = load i32, i32* %15, align 4
  %41 = load i32, i32* %17, align 4
  %42 = sub nsw i32 %40, %41
  %43 = load i32, i32* %18, align 4
  %44 = load i32, i32* %16, align 4
  %45 = sub nsw i32 %43, %44
  %46 = mul nsw i32 %42, %45
  %47 = load i32, i32* %16, align 4
  %48 = load i32, i32* %14, align 4
  %49 = sub nsw i32 %47, %48
  %50 = load i32, i32* %19, align 4
  %51 = load i32, i32* %17, align 4
  %52 = sub nsw i32 %50, %51
  %53 = mul nsw i32 %49, %52
  %54 = add nsw i32 %46, %53
  %55 = load i32*, i32** %20, align 4
  store i32 %54, i32* %55, align 4
  %56 = load i32, i32* %17, align 4
  %57 = load i32, i32* %13, align 4
  %58 = sub nsw i32 %56, %57
  %59 = load i32, i32* %18, align 4
  %60 = load i32, i32* %16, align 4
  %61 = sub nsw i32 %59, %60
  %62 = mul nsw i32 %58, %61
  %63 = load i32, i32* %12, align 4
  %64 = load i32, i32* %16, align 4
  %65 = sub nsw i32 %63, %64
  %66 = load i32, i32* %19, align 4
  %67 = load i32, i32* %17, align 4
  %68 = sub nsw i32 %66, %67
  %69 = mul nsw i32 %65, %68
  %70 = add nsw i32 %62, %69
  %71 = load i32*, i32** %21, align 4
  store i32 %70, i32* %71, align 4
  %72 = load i32*, i32** %22, align 4
  %73 = load i32, i32* %72, align 4
  %74 = load i32*, i32** %20, align 4
  %75 = load i32, i32* %74, align 4
  %76 = sub nsw i32 %73, %75
  %77 = load i32*, i32** %21, align 4
  %78 = load i32, i32* %77, align 4
  %79 = sub nsw i32 %76, %78
  store i32 %79, i32* %23, align 4
  %80 = load i32*, i32** %20, align 4
  %81 = load i32, i32* %80, align 4
  %82 = icmp sgt i32 %81, 0
  %83 = zext i1 %82 to i32
  %84 = load i32*, i32** %20, align 4
  %85 = load i32, i32* %84, align 4
  %86 = icmp slt i32 %85, 0
  %87 = zext i1 %86 to i32
  %88 = sub nsw i32 %83, %87
  %89 = load i32*, i32** %22, align 4
  %90 = load i32, i32* %89, align 4
  %91 = icmp sgt i32 %90, 0
  %92 = zext i1 %91 to i32
  %93 = load i32*, i32** %22, align 4
  %94 = load i32, i32* %93, align 4
  %95 = icmp slt i32 %94, 0
  %96 = zext i1 %95 to i32
  %97 = sub nsw i32 %92, %96
  %98 = icmp eq i32 %88, %97
  br i1 %98, label %103, label %99

99:                                               ; preds = %11
  %100 = load i32*, i32** %20, align 4
  %101 = load i32, i32* %100, align 4
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %150

103:                                              ; preds = %99, %11
  %104 = load i32*, i32** %21, align 4
  %105 = load i32, i32* %104, align 4
  %106 = icmp sgt i32 %105, 0
  %107 = zext i1 %106 to i32
  %108 = load i32*, i32** %21, align 4
  %109 = load i32, i32* %108, align 4
  %110 = icmp slt i32 %109, 0
  %111 = zext i1 %110 to i32
  %112 = sub nsw i32 %107, %111
  %113 = load i32*, i32** %22, align 4
  %114 = load i32, i32* %113, align 4
  %115 = icmp sgt i32 %114, 0
  %116 = zext i1 %115 to i32
  %117 = load i32*, i32** %22, align 4
  %118 = load i32, i32* %117, align 4
  %119 = icmp slt i32 %118, 0
  %120 = zext i1 %119 to i32
  %121 = sub nsw i32 %116, %120
  %122 = icmp eq i32 %112, %121
  br i1 %122, label %127, label %123

123:                                              ; preds = %103
  %124 = load i32*, i32** %21, align 4
  %125 = load i32, i32* %124, align 4
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %127, label %150

127:                                              ; preds = %123, %103
  %128 = load i32, i32* %23, align 4
  %129 = icmp sgt i32 %128, 0
  %130 = zext i1 %129 to i32
  %131 = load i32, i32* %23, align 4
  %132 = icmp slt i32 %131, 0
  %133 = zext i1 %132 to i32
  %134 = sub nsw i32 %130, %133
  %135 = load i32*, i32** %22, align 4
  %136 = load i32, i32* %135, align 4
  %137 = icmp sgt i32 %136, 0
  %138 = zext i1 %137 to i32
  %139 = load i32*, i32** %22, align 4
  %140 = load i32, i32* %139, align 4
  %141 = icmp slt i32 %140, 0
  %142 = zext i1 %141 to i32
  %143 = sub nsw i32 %138, %142
  %144 = icmp eq i32 %134, %143
  br i1 %144, label %148, label %145

145:                                              ; preds = %127
  %146 = load i32, i32* %23, align 4
  %147 = icmp eq i32 %146, 0
  br label %148

148:                                              ; preds = %145, %127
  %149 = phi i1 [ true, %127 ], [ %147, %145 ]
  br label %150

150:                                              ; preds = %148, %123, %99
  %151 = phi i1 [ false, %123 ], [ false, %99 ], [ %149, %148 ]
  ret i1 %151
}
; Function Attrs: noinline nounwind optnone
define internal i32 @mix_colors3(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  %25 = alloca i64, align 8
  %26 = alloca i32, align 4
  %27 = alloca i64, align 8
  %28 = alloca i64, align 8
  %29 = alloca i64, align 8
  %30 = alloca i64, align 8
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store i32 %3, i32* %11, align 4
  store i32 %4, i32* %12, align 4
  store i32 %5, i32* %13, align 4
  %31 = load i32, i32* %8, align 4
  %32 = and i32 %31, 255
  %33 = lshr i32 %32, 0
  %34 = zext i32 %33 to i64
  store i64 %34, i64* %14, align 8
  %35 = load i32, i32* %8, align 4
  %36 = and i32 %35, 65280
  %37 = lshr i32 %36, 8
  %38 = zext i32 %37 to i64
  store i64 %38, i64* %15, align 8
  %39 = load i32, i32* %8, align 4
  %40 = and i32 %39, 16711680
  %41 = lshr i32 %40, 16
  %42 = zext i32 %41 to i64
  store i64 %42, i64* %16, align 8
  %43 = load i32, i32* %8, align 4
  %44 = and i32 %43, -16777216
  %45 = lshr i32 %44, 24
  %46 = zext i32 %45 to i64
  store i64 %46, i64* %17, align 8
  %47 = load i32, i32* %9, align 4
  %48 = and i32 %47, 255
  %49 = lshr i32 %48, 0
  %50 = zext i32 %49 to i64
  store i64 %50, i64* %18, align 8
  %51 = load i32, i32* %9, align 4
  %52 = and i32 %51, 65280
  %53 = lshr i32 %52, 8
  %54 = zext i32 %53 to i64
  store i64 %54, i64* %19, align 8
  %55 = load i32, i32* %9, align 4
  %56 = and i32 %55, 16711680
  %57 = lshr i32 %56, 16
  %58 = zext i32 %57 to i64
  store i64 %58, i64* %20, align 8
  %59 = load i32, i32* %9, align 4
  %60 = and i32 %59, -16777216
  %61 = lshr i32 %60, 24
  %62 = zext i32 %61 to i64
  store i64 %62, i64* %21, align 8
  %63 = load i32, i32* %10, align 4
  %64 = and i32 %63, 255
  %65 = lshr i32 %64, 0
  %66 = zext i32 %65 to i64
  store i64 %66, i64* %22, align 8
  %67 = load i32, i32* %10, align 4
  %68 = and i32 %67, 65280
  %69 = lshr i32 %68, 8
  %70 = zext i32 %69 to i64
  store i64 %70, i64* %23, align 8
  %71 = load i32, i32* %10, align 4
  %72 = and i32 %71, 16711680
  %73 = lshr i32 %72, 16
  %74 = zext i32 %73 to i64
  store i64 %74, i64* %24, align 8
  %75 = load i32, i32* %10, align 4
  %76 = and i32 %75, -16777216
  %77 = lshr i32 %76, 24
  %78 = zext i32 %77 to i64
  store i64 %78, i64* %25, align 8
  %79 = load i32, i32* %13, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %171

81:                                               ; preds = %6
  %82 = load i32, i32* %13, align 4
  %83 = load i32, i32* %11, align 4
  %84 = sub nsw i32 %82, %83
  %85 = load i32, i32* %12, align 4
  %86 = sub nsw i32 %84, %85
  store i32 %86, i32* %26, align 4
  %87 = load i64, i64* %14, align 8
  %88 = load i32, i32* %11, align 4
  %89 = sext i32 %88 to i64
  %90 = mul nsw i64 %87, %89
  %91 = load i64, i64* %18, align 8
  %92 = load i32, i32* %12, align 4
  %93 = sext i32 %92 to i64
  %94 = mul nsw i64 %91, %93
  %95 = add nsw i64 %90, %94
  %96 = load i64, i64* %22, align 8
  %97 = load i32, i32* %26, align 4
  %98 = sext i32 %97 to i64
  %99 = mul nsw i64 %96, %98
  %100 = add nsw i64 %95, %99
  %101 = load i32, i32* %13, align 4
  %102 = sext i32 %101 to i64
  %103 = sdiv i64 %100, %102
  store i64 %103, i64* %27, align 8
  %104 = load i64, i64* %15, align 8
  %105 = load i32, i32* %11, align 4
  %106 = sext i32 %105 to i64
  %107 = mul nsw i64 %104, %106
  %108 = load i64, i64* %19, align 8
  %109 = load i32, i32* %12, align 4
  %110 = sext i32 %109 to i64
  %111 = mul nsw i64 %108, %110
  %112 = add nsw i64 %107, %111
  %113 = load i64, i64* %23, align 8
  %114 = load i32, i32* %26, align 4
  %115 = sext i32 %114 to i64
  %116 = mul nsw i64 %113, %115
  %117 = add nsw i64 %112, %116
  %118 = load i32, i32* %13, align 4
  %119 = sext i32 %118 to i64
  %120 = sdiv i64 %117, %119
  store i64 %120, i64* %28, align 8
  %121 = load i64, i64* %16, align 8
  %122 = load i32, i32* %11, align 4
  %123 = sext i32 %122 to i64
  %124 = mul nsw i64 %121, %123
  %125 = load i64, i64* %20, align 8
  %126 = load i32, i32* %12, align 4
  %127 = sext i32 %126 to i64
  %128 = mul nsw i64 %125, %127
  %129 = add nsw i64 %124, %128
  %130 = load i64, i64* %24, align 8
  %131 = load i32, i32* %26, align 4
  %132 = sext i32 %131 to i64
  %133 = mul nsw i64 %130, %132
  %134 = add nsw i64 %129, %133
  %135 = load i32, i32* %13, align 4
  %136 = sext i32 %135 to i64
  %137 = sdiv i64 %134, %136
  store i64 %137, i64* %29, align 8
  %138 = load i64, i64* %17, align 8
  %139 = load i32, i32* %11, align 4
  %140 = sext i32 %139 to i64
  %141 = mul nsw i64 %138, %140
  %142 = load i64, i64* %21, align 8
  %143 = load i32, i32* %12, align 4
  %144 = sext i32 %143 to i64
  %145 = mul nsw i64 %142, %144
  %146 = add nsw i64 %141, %145
  %147 = load i64, i64* %25, align 8
  %148 = load i32, i32* %26, align 4
  %149 = sext i32 %148 to i64
  %150 = mul nsw i64 %147, %149
  %151 = add nsw i64 %146, %150
  %152 = load i32, i32* %13, align 4
  %153 = sext i32 %152 to i64
  %154 = sdiv i64 %151, %153
  store i64 %154, i64* %30, align 8
  %155 = load i64, i64* %27, align 8
  %156 = and i64 %155, 255
  %157 = shl i64 %156, 0
  %158 = load i64, i64* %28, align 8
  %159 = and i64 %158, 255
  %160 = shl i64 %159, 8
  %161 = or i64 %157, %160
  %162 = load i64, i64* %29, align 8
  %163 = and i64 %162, 255
  %164 = shl i64 %163, 16
  %165 = or i64 %161, %164
  %166 = load i64, i64* %30, align 8
  %167 = and i64 %166, 255
  %168 = shl i64 %167, 24
  %169 = or i64 %165, %168
  %170 = trunc i64 %169 to i32
  store i32 %170, i32* %7, align 4
  br label %172

171:                                              ; preds = %6
  store i32 0, i32* %7, align 4
  br label %172

172:                                              ; preds = %171, %81
  %173 = load i32, i32* %7, align 4
  ret i32 %173
}
; Function Attrs: noinline nounwind optnone
define internal void @olivec_blend_color(i32* %0, i32 %1) #0 {
  %3 = alloca i32*, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32* %0, i32** %3, align 4
  store i32 %1, i32* %4, align 4
  %13 = load i32*, i32** %3, align 4
  %14 = load i32, i32* %13, align 4
  %15 = and i32 %14, 255
  %16 = lshr i32 %15, 0
  store i32 %16, i32* %5, align 4
  %17 = load i32*, i32** %3, align 4
  %18 = load i32, i32* %17, align 4
  %19 = and i32 %18, 65280
  %20 = lshr i32 %19, 8
  store i32 %20, i32* %6, align 4
  %21 = load i32*, i32** %3, align 4
  %22 = load i32, i32* %21, align 4
  %23 = and i32 %22, 16711680
  %24 = lshr i32 %23, 16
  store i32 %24, i32* %7, align 4
  %25 = load i32*, i32** %3, align 4
  %26 = load i32, i32* %25, align 4
  %27 = and i32 %26, -16777216
  %28 = lshr i32 %27, 24
  store i32 %28, i32* %8, align 4
  %29 = load i32, i32* %4, align 4
  %30 = and i32 %29, 255
  %31 = lshr i32 %30, 0
  store i32 %31, i32* %9, align 4
  %32 = load i32, i32* %4, align 4
  %33 = and i32 %32, 65280
  %34 = lshr i32 %33, 8
  store i32 %34, i32* %10, align 4
  %35 = load i32, i32* %4, align 4
  %36 = and i32 %35, 16711680
  %37 = lshr i32 %36, 16
  store i32 %37, i32* %11, align 4
  %38 = load i32, i32* %4, align 4
  %39 = and i32 %38, -16777216
  %40 = lshr i32 %39, 24
  store i32 %40, i32* %12, align 4
  %41 = load i32, i32* %5, align 4
  %42 = load i32, i32* %12, align 4
  %43 = sub i32 255, %42
  %44 = mul i32 %41, %43
  %45 = load i32, i32* %9, align 4
  %46 = load i32, i32* %12, align 4
  %47 = mul i32 %45, %46
  %48 = add i32 %44, %47
  %49 = udiv i32 %48, 255
  store i32 %49, i32* %5, align 4
  %50 = load i32, i32* %5, align 4
  %51 = icmp ugt i32 %50, 255
  br i1 %51, label %52, label %53

52:                                               ; preds = %2
  store i32 255, i32* %5, align 4
  br label %53

53:                                               ; preds = %52, %2
  %54 = load i32, i32* %6, align 4
  %55 = load i32, i32* %12, align 4
  %56 = sub i32 255, %55
  %57 = mul i32 %54, %56
  %58 = load i32, i32* %10, align 4
  %59 = load i32, i32* %12, align 4
  %60 = mul i32 %58, %59
  %61 = add i32 %57, %60
  %62 = udiv i32 %61, 255
  store i32 %62, i32* %6, align 4
  %63 = load i32, i32* %6, align 4
  %64 = icmp ugt i32 %63, 255
  br i1 %64, label %65, label %66

65:                                               ; preds = %53
  store i32 255, i32* %6, align 4
  br label %66

66:                                               ; preds = %65, %53
  %67 = load i32, i32* %7, align 4
  %68 = load i32, i32* %12, align 4
  %69 = sub i32 255, %68
  %70 = mul i32 %67, %69
  %71 = load i32, i32* %11, align 4
  %72 = load i32, i32* %12, align 4
  %73 = mul i32 %71, %72
  %74 = add i32 %70, %73
  %75 = udiv i32 %74, 255
  store i32 %75, i32* %7, align 4
  %76 = load i32, i32* %7, align 4
  %77 = icmp ugt i32 %76, 255
  br i1 %77, label %78, label %79

78:                                               ; preds = %66
  store i32 255, i32* %7, align 4
  br label %79

79:                                               ; preds = %78, %66
  %80 = load i32, i32* %5, align 4
  %81 = and i32 %80, 255
  %82 = shl i32 %81, 0
  %83 = load i32, i32* %6, align 4
  %84 = and i32 %83, 255
  %85 = shl i32 %84, 8
  %86 = or i32 %82, %85
  %87 = load i32, i32* %7, align 4
  %88 = and i32 %87, 255
  %89 = shl i32 %88, 16
  %90 = or i32 %86, %89
  %91 = load i32, i32* %8, align 4
  %92 = and i32 %91, 255
  %93 = shl i32 %92, 24
  %94 = or i32 %90, %93
  %95 = load i32*, i32** %3, align 4
  store i32 %94, i32* %95, align 4
  ret void
}
; Function Attrs: nounwind readnone
declare float @atan2f(float, float) #1
; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2
; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.cos.f32(float) #2
; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.sin.f32(float) #2
; Function Attrs: noinline nounwind optnone
define internal void @make_vector2(%struct.Vector2* noalias sret align 4 %0, float %1, float %2) #0 {
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  store float %1, float* %4, align 4
  store float %2, float* %5, align 4
  %6 = load float, float* %4, align 4
  %7 = getelementptr inbounds %struct.Vector2, %struct.Vector2* %0, i32 0, i32 0
  store float %6, float* %7, align 4
  %8 = load float, float* %5, align 4
  %9 = getelementptr inbounds %struct.Vector2, %struct.Vector2* %0, i32 0, i32 1
  store float %8, float* %9, align 4
  ret void
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readnone }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Apple clang version 12.0.0 (clang-1200.0.32.29)"}
