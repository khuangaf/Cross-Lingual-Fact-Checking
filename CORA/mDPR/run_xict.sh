python -m torch.distributed.launch \
    --nproc_per_node 1 run_xict.py \
    --max_grad_norm 2.0 \
    --encoder_model_type hf_bert \
    --pretrained_model_cfg bert-base-multilingual-uncased \
    --seed 12345 --sequence_length 256 \
    --warmup_steps 300 --batch_size 4  --do_lower_case \
    --train_file "../../data/bbc_passages/all_ict_samples.jsonl_[0,1,2]" \
    --dev_file ../../data/bbc_passages/all_ict_samples.jsonl_dev \
    --output_dir xict_outputs \
    --checkpoint_file_name xICT_biencoder.pt \
    --learning_rate 2e-05 --num_train_epochs 40 \
    --dev_batch_size 6 --val_av_rank_start_epoch 30