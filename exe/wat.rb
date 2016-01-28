#!/usr/bin/env ruby
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'wat-shell'

require 'irb'

def run
  STDOUT.sync = true

  IRB.setup(nil)

  irb = IRB::Irb.new

  IRB.conf[:MAIN_CONTEXT] = irb.context
  irb.context.irb_name = 'wat'

  Wat.included(irb.context.main)

  trap("SIGINT") do
    irb.signal_handle
  end

  begin
    catch(:IRB_EXIT) do
      irb.eval_input
    end
  ensure
    irb_at_exit
  end
end

run
