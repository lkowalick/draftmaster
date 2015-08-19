module MatchesHelper
  def stats_for(match)
    if match.completed
      "#{match.player_one_wins}-#{match.player_two_wins}"
    else
      'In Progress'
    end
  end

  PANEL_CLASSES = %w(panel-default panel-primary)

  def panel_classes
    PANEL_CLASSES.join(' ')
  end

  def panel_class_for(match)
    if match.completed
      PANEL_CLASSES.first
    else
      PANEL_CLASSES.second
    end
  end
end
