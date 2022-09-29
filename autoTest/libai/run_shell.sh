# libai

cd /ssd/oneTest/OneAutoTest/autoTest/libai/
cp ../../libai/args_libai_bert.sh scripts/libai/tools/
cp ../../libai/bert_nl24_nah16_hs1024.py scripts/libai/configs
sed -i 's/01b1d32/oneflow-28/g' scripts/libai/tools/args_libai_bert.sh
sed -i 's/RUN_COMMIT/HOSTNAME/g' scripts/libai/tools/args_libai_bert.sh
sed -i 's/\/path\/to/\/ssd\/dataset\/libai_dataset/g' scripts/libai/configs/bert_nl24_nah16_hs1024.py

cp ../../libai/args_libai_gpt2.sh scripts/libai/tools/
cp ../../libai/gpt2_nl24_nah16_hs1024.py scripts/libai/configs
sed -i 's/01b1d32/oneflow-28/g' scripts/libai/tools/args_libai_gpt2.sh
sed -i 's/RUN_COMMIT/HOSTNAME/g' scripts/libai/tools/args_libai_gpt2.sh
sed -i 's/\/path\/to/\/ssd\/dataset\/libai_dataset/g' scripts/libai/configs/gpt2_nl24_nah16_hs1024.py

sed -i '/for self.iter in range(start_iter, max_iter):/a\                    if self.iter == 99: \
                      cmd = "nvidia-smi --query-gpu=timestamp,name,driver_version,utilization.gpu,utilization.memory,memory.total,memory.free,memory.used --format=csv" \
                      os.system(cmd)' scripts/libai/libai/engine/trainer.py
sed -i '/import time/a\import os' scripts/libai/libai/engine/trainer.py
sed -i '/hooks.PeriodicCheckpointer/#hooks.PeriodicCheckpointer' scripts/libai/libai/engine/default.py


# libai-bert
cd /ssd/oneTest/OneAutoTest/autoTest/libai && bash examples/libai_bert_1n1g.sh
cd /ssd/oneTest/OneAutoTest/autoTest/libai && bash examples/libai_bert_1n4g.sh
cd /ssd/oneTest/OneAutoTest/autoTest/libai && bash examples/libai_bert_1n8g.sh

# libai-gpt
cd /ssd/oneTest/OneAutoTest/autoTest/libai && bash examples/libai_gpt_1n1g.sh
cd /ssd/oneTest/OneAutoTest/autoTest/libai && bash examples/libai_gpt_1n4g.sh
cd /ssd/oneTest/OneAutoTest/autoTest/libai && bash examples/libai_gpt_1n8g.sh