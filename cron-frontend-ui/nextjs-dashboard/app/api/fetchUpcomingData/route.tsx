import clientPromise from "@/app/lib/mongodb";
import { NextRequest, NextResponse } from "next/server";


export async function POST(req: NextRequest) {
    try {
      const client = await clientPromise;
      const db = client.db("cronbot");
      const service_schedule = await db
          .collection("service_schedule")
          .find({ date: { $gt: (new Date()).toISOString() } })
          .sort({ date: 1})
          .limit(1)
          .toArray();
      return NextResponse.json(service_schedule);
    } catch (e) {
        console.error(e);
        return NextResponse.json({ error: 'Failed to load data'})
    }
  }
