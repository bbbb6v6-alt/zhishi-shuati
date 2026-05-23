import express from "express";
import cors from "cors";
import questionsRouter from "./routes/questions.js";
import importRouter from "./routes/import.js";
import { getSupabaseClient } from "./storage/database/supabase-client.js";

const app = express();
const port = process.env.PORT || 9091;

// Middleware
app.use(cors());
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: '50mb', extended: true }));

// Health check
app.get('/api/v1/health', (req, res) => {
  console.log('Health check success');
  res.status(200).json({ status: 'ok' });
});

// Routes
app.use('/api/v1/questions', questionsRouter);
app.use('/api/v1/import', importRouter);

// Debug route to fix options
app.post('/api/v1/debug/fix-options', async (req, res) => {
  const client = getSupabaseClient();
  try {
    const { data, error } = await client
      .from('questions')
      .select('id, type')
      .in('type', ['choice', 'multiple_choice']);
    
    if (error) throw error;
    
    let fixed = 0;
    for (const q of (data || [])) {
      const { error: updateError } = await client
        .from('questions')
        .update({ options: ['A', 'B', 'C', 'D'] })
        .eq('id', q.id);
      
      if (!updateError) fixed++;
    }
    
    res.json({ success: true, fixed });
  } catch (err: any) {
    res.status(500).json({ error: err.message });
  }
});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}/`);
});
