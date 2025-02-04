import torch
import subprocess

def check_nvidia_smi():
    try:
        output = subprocess.check_output("nvidia-smi", shell=True, universal_newlines=True)
        print("=== NVIDIA-SMI Output ===")
        print(output)
    except Exception as e:
        print("nvidia-smi not found or not accessible:", e)

def check_pytorch_cuda():
    if torch.cuda.is_available():
        print(f"PyTorch CUDA is available. GPU count: {torch.cuda.device_count()}")
        for i in range(torch.cuda.device_count()):
            print(f"GPU {i}: {torch.cuda.get_device_name(i)}")
    else:
        print("PyTorch CUDA is NOT available.")

if __name__ == "__main__":
    check_nvidia_smi()
    check_pytorch_cuda()
